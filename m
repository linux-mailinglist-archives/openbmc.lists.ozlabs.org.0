Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5842D08CC
	for <lists+openbmc@lfdr.de>; Mon,  7 Dec 2020 02:20:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cq58H5n2VzDqc9
	for <lists+openbmc@lfdr.de>; Mon,  7 Dec 2020 12:19:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=3mdeb.com (client-ip=46.105.56.233; helo=8.mo69.mail-out.ovh.net;
 envelope-from=michal.zygowski@3mdeb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=3mdeb.com
X-Greylist: delayed 4670 seconds by postgrey-1.36 at bilbo;
 Sat, 05 Dec 2020 02:21:16 AEDT
Received: from 8.mo69.mail-out.ovh.net (8.mo69.mail-out.ovh.net
 [46.105.56.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnbyN5xFXzDr1m
 for <openbmc@lists.ozlabs.org>; Sat,  5 Dec 2020 02:21:04 +1100 (AEDT)
Received: from player711.ha.ovh.net (unknown [10.108.57.188])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 7D767A4576
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 15:03:08 +0100 (CET)
Received: from 3mdeb.com (89-64-120-157.dynamic.chello.pl [89.64.120.157])
 (Authenticated sender: michal.zygowski@3mdeb.com)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id C6EE318B0785E
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 14:03:07 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00244d6db88-b76b-4e71-8878-90b740143c27,
 20AAEE8A65658EE0CCDCACB608A572CA25E81723) smtp.auth=michal.zygowski@3mdeb.com
X-OVh-ClientIp: 89.64.120.157
From: =?UTF-8?B?TWljaGHFgiDFu3lnb3dza2k=?= <michal.zygowski@3mdeb.com>
Subject: Open Source Firmware, BMC and Bootloader devroom CFP
To: openbmc@lists.ozlabs.org
Message-ID: <f9cde0fb-672d-3301-9527-8498b00e4a37@3mdeb.com>
Date: Fri, 4 Dec 2020 15:03:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------30C8628FAF78694674A4A256"
Content-Language: en-US
X-Ovh-Tracer-Id: 4727653711070198530
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhuffvkffffgggtgesrgdtreertdefjeenucfhrhhomhepofhitghhrghlucjlhihgohifshhkihcuoehmihgthhgrlhdriiihghhofihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedthffffffhvefgleevleeiteegheeutdehudegleekgffgheelfeffveejvdeuueenucffohhmrghinhepfhhoshguvghmrdhorhhgnecukfhppedtrddtrddtrddtpdekledrieegrdduvddtrdduheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehmihgthhgrlhdriiihghhofihskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhg
X-Mailman-Approved-At: Mon, 07 Dec 2020 12:19:06 +1100
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------30C8628FAF78694674A4A256
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,


The Open Source Firmware, BMC and Bootloader devroom will take place

on Sunday, 7th February 2021 at FOSDEM, virtual.


Call for Participation

----------------------

We are opening the call for participation to our devroom, with the deadline

for talk proposals set to Sunday, 20th December 2020 23:59:59 UTC.


Devroom Scope

-------------

The devroom will focus on various topics related to the open source
firmware,

BMC and bootloaders including security issues. It will help to get together

all interested people in one place, present and discuss current developments

and issues haunting the community. Additionally, it will foster awareness

among attendees about pre-OS topics.


Possible topics: GRUB, TrustedGRUB, iPXE, TrenchBoot, coreboot, LinuxBoot,

SeaBIOS, UEFI, OVMF, TianoCore, hostboot, IPMI, OpenBMC, u-bmc, TPM,

attestation, security of firmware, BMC, bootloaders and related topics and

technologies.


Ideal submissions are actionable and opinionated. Submissions may be in the

form of 25 or 45 minutes talks, panel sessions or round-table discussions.


Dates

-----

Submission Deadline:     20-Dec-2020 @ 23:59:59 UTC

Acceptance Notification: 31-Dec-2020

Final Schedule Posted:   31-Dec-2020


Recording and uploading presentations: 04-Jan-2021 - 16-Jan-2021

Processing, reviewing, fixing videos:  17-Jan-2021 - 31-Jan-2021


How to submit

--------------

Visit https://penta.fosdem.org/submission/FOSDEM21


1) If you do not have an account, create one here

2) Click "Create Event"

3) Enter your presentation details

4) Be sure to select the Open Source Firmware,

   BMC and Bootloader devroom track!

5) Submit


What to include

---------------

- The title of your submission

- A 1-paragraph abstract

- A longer description including the benefit of your talk to your target

  audience, including a definition of your target audience

- Approximate length/type of submission (talk, BoF, ...)

- Links to related websites/blogs/talk material (if any)


Administrative Notes

--------------------

Since the FOSDEM21 is going virtual, the talks will be prerecorded. We
will be

streaming the recordings and performing live Q&A of the Open Source
Firmware,

BMC and Bootloader devroom. Presenting at FOSDEM implies permission to
record

your session and distribute the recording afterwards. All videos will be
made

available under the standard FOSDEM content license (CC-BY).


If you have any questions, feel free to contact the devroom organizers:

  Daniel Kiper (daniel.kiper at oracle.com) and

  Michał Żygowski (michal.zygowski at 3mdeb.com).


Daniel & Michał



--------------30C8628FAF78694674A4A256
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"
      id="docs-internal-guid-7bba16f1-7fff-c584-bf97-4e85353ba647"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Hi,</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">The Open Source Firmware, BMC and Bootloader devroom will take place</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">on Sunday, 7th February 2021 at FOSDEM, virtual.</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Call for Participation</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">----------------------</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">We are opening the call for participation to our devroom, with the deadline</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">for talk proposals set to Sunday, 20th December 2020 23:59:59 UTC.</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Devroom Scope</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">-------------</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">The devroom will focus on various topics related to the open source firmware,</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">BMC and bootloaders including security issues. It will help to get together</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">all interested people in one place, present and discuss current developments</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">and issues haunting the community. Additionally, it will foster awareness</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">among attendees about pre-OS topics.</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Possible topics: GRUB, TrustedGRUB, iPXE, TrenchBoot, coreboot, LinuxBoot,</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">SeaBIOS, UEFI, OVMF, TianoCore, hostboot, IPMI, OpenBMC, u-bmc, TPM,</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">attestation, security of firmware, BMC, bootloaders and related topics and</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">technologies.</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Ideal submissions are actionable and opinionated. Submissions may be in the</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">form of 25 or 45 minutes talks, panel sessions or round-table discussions.</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Dates</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">-----</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Submission Deadline:     20-Dec-2020 @ 23:59:59 UTC</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Acceptance Notification: 31-Dec-2020</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Final Schedule Posted:   31-Dec-2020</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Recording and uploading presentations: 04-Jan-2021 - 16-Jan-2021</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Processing, reviewing, fixing videos:  17-Jan-2021 - 31-Jan-2021</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">How to submit</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">--------------</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Visit <a class="moz-txt-link-freetext" href="https://penta.fosdem.org/submission/FOSDEM21" moz-do-not-send="true">https://penta.fosdem.org/submission/FOSDEM21</a></span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">1) If you do not have an account, create one here</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">2) Click "Create Event"</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">3) Enter your presentation details</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">4) Be sure to select the Open Source Firmware,</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">   BMC and Bootloader devroom track!</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">5) Submit</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">What to include</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">---------------</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">- The title of your submission</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">- A 1-paragraph abstract</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">- A longer description including the benefit of your talk to your target</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">  audience, including a definition of your target audience</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">- Approximate length/type of submission (talk, BoF, ...)</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">- Links to related websites/blogs/talk material (if any)</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Administrative Notes</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">--------------------</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Since the FOSDEM21 is going virtual, the talks will be prerecorded. We will be</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">streaming the recordings and performing live Q&amp;A of the Open Source Firmware,</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">BMC and Bootloader devroom. Presenting at FOSDEM implies permission to record</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">your session and distribute the recording afterwards. All videos will be made</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">available under the standard FOSDEM content license (CC-BY).</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">If you have any questions, feel free to contact the devroom organizers:</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">  Daniel Kiper (daniel.kiper at oracle.com) and</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">  Michał Żygowski (michal.zygowski at 3mdeb.com).</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Daniel &amp; Michał</span></p>
    <br>
  </body>
</html>

--------------30C8628FAF78694674A4A256--
