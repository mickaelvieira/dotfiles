module.exports = {
    'extends': 'airbnb',
    'plugins': [
        'react',
        'jsx-a11y',
        'import'
    ],
    'rules': {
      'no-alert': 'off',
      'comma-dangle': ['error', {
        arrays: 'always-multiline',
        objects: 'always-multiline',
        imports: 'always-multiline',
        exports: 'always-multiline',
        functions: 'ignore',
      }],
      'react/jsx-filename-extension': [1, { 'extensions': ['.js', '.jsx'] }],
      'react/jsx-curly-spacing': ['error', 'always', { allowMultiline: true }],
      'react/prefer-stateless-function': ['error', { ignorePureComponents: true }],
    },
    'env': {
        'browser': true
    }
};
