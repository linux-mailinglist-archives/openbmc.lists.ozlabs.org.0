Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA516D5BE
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 22:27:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qQfJ4Tv7zDqWH
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 06:27:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45qQdZ4PrzzDqTy
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 06:26:23 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D68C344;
 Thu, 18 Jul 2019 13:26:20 -0700 (PDT)
Received: from supven01-thinkstation-p720.austin.arm.com
 (supven01-thinkstation-p720.austin.arm.com [10.118.30.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 564423F71F;
 Thu, 18 Jul 2019 13:26:20 -0700 (PDT)
Message-ID: <7011303cd18ca5a722b66b18a8b726477587d78f.camel@arm.com>
Subject: Remote Debug Feature Proposal for Arm (Aarch64) based  Servers
 using OpenBMC
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: openbmc@lists.ozlabs.org
Date: Thu, 18 Jul 2019 20:26:20 +0000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Jeff.Booher-Kaeding@arm.com, Dong.Wei@arm.com, John.Horley@arm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

OpenBMCers,

Just a heads up...

Would anyone be interested in collaborating on Remote Debug for Arm
(Aarch64) based  Servers?

A brief design document (may not be in OpenBMC design document format
yet.)

The design is in flux at the moment and will appreciate your
inputs/feedback.

Problem Description
Arm (Aarch64) SOC based servers need a remote source level debugging
capability over JTAG.

There are several proprietary solutions. However, standardization is
key to ensure that Arm Ecosystem does not get fragmented by point
solutions that plague the industry today.

Background and References
What is Remote Debug?
Server Remote Debug is the act of gaining visibility of the hardware
and software behaviors of an SoC, using a debugger which is not
directly connected to the Server SoC.

Requirements
Arm (Aarch64) SOC based server interface requirements
1. Must have JTAG port.
2. Must have Arm Debug Access Port (DAP)
3. Authentication to allow debug access.

BMC Stack
1. Integration of OpenOCD stack.
2. Authentication of user (debugger) to BMC.
3. Re-use/Leverage existing BMC JTAG driver. (if any)
4. Framework for "other" traffic over JTAG and Arm DAP (e.g. for
authentication on SOC)
5. Leverage/Define protocols for communicating between the debugger and
the BMC.
6. Define mechanisms for ensuring only suitable debuggers can access
the SoC.

Proposed Design
Proposal is to integrate OpenOCD within OpenBMC stack.
OpenOCD is a open source on-chip debuging solution for JTAG connected
processors. It enables sourcelevel debugging with GNU gdb. It can also
intergrate with and GDB aware IDE, such as eclipse.

"OpenOCD provides debugging support with a
layered architecture of JTAG interface and TAP support including:
- (X)SVF playback to faciliate automated boundary scan and FPGA/CPLD
  programming;
- debug target support (e.g. ARM, MIPS): single-stepping,
  breakpoints/watchpoints, gprof profiling, etc;
- flash chip drivers (e.g. CFI, NAND, internal flash);
- embedded TCL interpreter for easy scripting.

Several network interfaces are available for interacting with OpenOCD:
telnet, TCL, and GDB. The GDB server enables OpenOCD to function as a
"remote target" for source-level debugging of embedded systems using
the GNU GDB program (and the others who talk GDB protocol, e.g. IDA
Pro)."

Alternatives Considered
RFC

Impacts
TBD

Testing
TBD

Thanks,
Supreeth & Jeff

