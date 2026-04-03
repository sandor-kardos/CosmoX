import { z } from "zod";

export const insertProfileSchema = z.object({
  name: z.string().nullable().optional(),
  birthDate: z.string(),
  birthTime: z.string().nullable().optional(),
});

export type InsertProfile = z.infer<typeof insertProfileSchema>;
