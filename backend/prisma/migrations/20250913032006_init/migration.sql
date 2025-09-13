-- CreateTable
CREATE TABLE "public"."Resident" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "hall" TEXT,
    "room" TEXT,
    "lockoutCount" INTEGER NOT NULL DEFAULT 0,
    "firstLockoutAt" TIMESTAMP(3),
    "lastLockoutAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Resident_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Lockout" (
    "id" TEXT NOT NULL,
    "residentId" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "raName" TEXT NOT NULL,
    "notes" TEXT,
    "hall" TEXT,
    "room" TEXT,
    "paid" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Lockout_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Resident_studentId_key" ON "public"."Resident"("studentId");

-- AddForeignKey
ALTER TABLE "public"."Lockout" ADD CONSTRAINT "Lockout_residentId_fkey" FOREIGN KEY ("residentId") REFERENCES "public"."Resident"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
