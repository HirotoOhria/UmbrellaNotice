require("dotenv").config();

const crypto = require("crypto");
const S = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
const N = 21;
const createRandomNum = () =>
  Array.from(crypto.randomFillSync(new Uint8Array(N)))
    .map((n) => S[n % S.length])
    .join("");

const env = process.env;
const isProd = env.NODE_ENV === "production";

const path = require("path");
const withImages = require("next-images");

module.exports = withImages({
  resolve: {
    extensions: [".ts"],
    alias: {
      "public": path.resolve(__dirname, "./public"),
      "@": path.resolve(__dirname, "./src/components"),
      "constants": path.resolve(__dirname, "./src/constants"),
      "pages": path.resolve(__dirname, "./src/pages"),
      "services": path.resolve(__dirname, "./src/services"),
      "store": path.resolve(__dirname, "./src/store"),
      "types": path.resolve(__dirname, "./src/types"),
    },
  },
  env: {
    REACT_APP_IS_PROD: isProd,
    REACT_APP_AMPLIFY_REGION: env.REACT_APP_AMPLIFY_REGION,
    REACT_APP_AMPLIFY_USER_POOL_ID: env.REACT_APP_AMPLIFY_USER_POOL_ID,
    REACT_APP_AMPLIFY_WEB_CLIENT_ID: env.REACT_APP_AMPLIFY_WEB_CLIENT_ID,
    REACT_APP_AMPLIFY_IDENTITY_POOL_ID: env.REACT_APP_AMPLIFY_IDENTITY_POOL_ID,
    REACT_APP_TEST_USER_EMAIL: env.REACT_APP_TEST_USER_EMAIL,
    REACT_APP_TEST_USER_PASSWORD: env.REACT_APP_TEST_USER_PASSWORD,
  },
  assetPrefix: isProd ? "https://static.umbrellanotice.work" : "",
  generateBuildId: async () => {
    return env.CIRCLE_SHA1 || createRandomNum();
  },
});
