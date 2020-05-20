import * as fs from "https://deno.land/std/fs/mod.ts";
import * as path from "https://deno.land/std/path/mod.ts";

const Destination = Deno.env.get("HOME") + "/test-install-dotfiles";
const Cwd = path.resolve(".");

function info(msg: string): void {
  console.info(msg);
}

function error(msg: string): void {
  console.error(msg);
}

function warning(msg: string): void {
  console.warn(msg);
}

async function getURLContent(url: string): Promise<string> {
  try {
    const response = await fetch(url);
    const content = await response.text();
    return content;
  } catch (e) {
    error(e);
  }
  return "";
}

async function writeToFile(
  path: string,
  content: string,
): Promise<Deno.FileInfo | null> {
  try {
    await fs.writeFileStr(path, content);
    const file = await fileExists(path);
    return file;
  } catch (e) {
    error(e);
  }
  return null;
}

async function fileExists(path: string): Promise<Deno.FileInfo | null> {
  try {
    const file = await Deno.lstat(path);
    return file;
  } catch (e) {
  }
  return null;
}

async function createSymlink(target: string, symlink: string): Promise<void> {
  const backup = `${symlink}.orig`;

  const dest = await fileExists(symlink);
  if (dest && dest.isFile) {
    fs.move(symlink, backup, { overwrite: true });
  }

  const source = await fileExists(target);
  if (!source || (!source.isFile && !source.isDirectory)) {
    error(`Target ${target} is neither a file nor a directory`);
    return;
  }

  info(`Creating symlink ${symlink}`);
  Deno.symlink(target, symlink);
}

async function installBash() {
  const files = [
    ".bashrc",
    ".bash_prompt",
    ".bash_options",
    ".bash_export",
    ".bash_profile",
    ".bash_aliases",
    ".bash_functions",
    ".bash_logout",
    ".dircolors",
    ".profile",
  ];

  await Promise.all(
    files.map((file) =>
      createSymlink(`${Cwd}/bash/${file}`, `${Destination}/${file}`)
    ),
  );
}

async function installGit() {
  const path = `${Destination}/git-prompt.sh`;
  const url =
    "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh";

  const res = await fileExists(path);
  if (!res) {
    info("Fetching git-prompt.sh");

    const content = await getURLContent(url);
    await writeToFile(path, content);
  }

  const files = [
    ".gitconfig",
    ".gitignore",
    ".gitmessage",
    ".gitattributes",
  ];

  await Promise.all(
    files.map((file) =>
      createSymlink(`${Cwd}/git/${file}`, `${Destination}/${file}`)
    ),
  );
}

async function installTmux() {
  await createSymlink(`${Cwd}/tmux/.tmux.conf`, `${Destination}/.tmux.conf`);
}

async function installVim() {
  createSymlink(`${Cwd}/vim/.vim`, `${Destination}/.vim`);
  createSymlink(`${Cwd}/vim/.vimrc`, `${Destination}/.vimrc`);

  const files = [
    {
      src:
        "https://raw.githubusercontent.com/suan/vim-instant-markdown/master/after/ftplugin/markdown/instant-markdown.vim",
      dest: `${Destination}/.vim/after/ftplugin/markdown/instant-markdown.vim`,
    },
    {
      src:
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
      dest: `${Destination}/.vim/autoload/plug.vim`,
    },
  ];

  await Promise.all(files.map(async ({ src, dest }) => {
    const content = await getURLContent(src);
    await writeToFile(dest, content);
  }));

  warning("Don't forget to run PlugInstall!");
}

(async function () {
  info(`Destination: ${Destination}`);
  info(`Working directory: ${Cwd}`);

  const archive = "dotfiles.zip";
  // const url = "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
  // const url = "https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/bin/arch-update"
  const url = "https://github.com/mickaelvieira/dotfiles/archive/master.zip";
  const content = await getURLContent(url);
  const file = await writeToFile(archive, content);

  Deno.create()
  Deno.write()

  if (file) {
    console.log(file);
    Deno.run({
      cmd: ["unzip", archive],
    });
  }

  // await installBash();
  // await installGit();
  // await installTmux();
  // await installVim();
}());
