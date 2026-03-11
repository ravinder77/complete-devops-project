const request = require("supertest");
const app = require("../src/app");

describe("Node App Tests", () => {

    test("GET / should return message", async () => {
        const res = await request(app).get("/");

        expect(res.statusCode).toBe(200);
        expect(res.body.message).toBe("Node.js App Running");
    });

    test("GET /health should return UP", async () => {
        const res = await request(app).get("/health");

        expect(res.statusCode).toBe(200);
        expect(res.body.status).toBe("UP");
    });

});