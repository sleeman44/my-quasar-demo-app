/* eslint-disable */

declare namespace NodeJS {
  interface ProcessEnv {
    NODE_ENV: string;
    VUE_ROUTER_MODE: 'hash' | 'history' | 'abstract' | undefined;
    VUE_ROUTER_BASE: string | undefined;
  }
}

declare global {
  // Extend the Window interface to include __VITE_API_URL__
  interface Window {
    VITE_API_URL: string;
    API_URL: string;
  }
}
export{}
