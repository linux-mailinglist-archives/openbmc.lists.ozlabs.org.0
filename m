Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DDD8BA08F
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 20:32:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bBjF0sVm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVjGh21qZz3cZ6
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2024 04:32:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bBjF0sVm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=osk@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVjG61gl5z3cR3
	for <openbmc@lists.ozlabs.org>; Fri,  3 May 2024 04:32:13 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ec76185cb3so31575ad.0
        for <openbmc@lists.ozlabs.org>; Thu, 02 May 2024 11:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714674728; x=1715279528; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vvx9nMnU2EZUZ5y+s47kZcyYB1/w05TGpsoAfd1Ovwo=;
        b=bBjF0sVmPHqzvjQ1evb6GOMoLIft0UflOS9kg48Tc0jaknLrAeijg3OClyvZGSbJI5
         Nsb7JvMkhu083BIJePGzm83bPtgS3a4LJySkyI3r3QiQ5B89NtwWb7odKJGftlp0GfqI
         3BX/C9x8BICTAzNxufyuUIdua8qWGH706v3L0v9Z7S/LFu2dj+9GOHu2sZFw+VAclE1V
         QuaKOjMuqliC6v/pf6oOBw135nWjntz3Q9Xz9MWo9TrqlUU4XLwRRuXKFJ9tPUtGoFZN
         ggziR3+dhQFeC/uzpcH5ppM0DpCkp5X1yjKVL5BGdRa8O5jy3hgh05vs70ID9Ulm36Kf
         y0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714674728; x=1715279528;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvx9nMnU2EZUZ5y+s47kZcyYB1/w05TGpsoAfd1Ovwo=;
        b=rPOjbDRO1KfPgmBnDcryiQGqMuBqduuBDHWKFXQQrz8xFN7WE1S4FT66vvjJ83g/gq
         DhaPI4rjiKLwPS2B92tnHps/1TWAHjTtLoWvannSXFq84GXcpoHB657iHoYl/6I/7sbM
         5Qmnu927k60X889Mtkj3tVGkSVbsB2qKWABJExaGvgULRoQ4nqV+iggjwtVcoyoSdzV/
         +S7Vtp/McqhZHvdpIyOqw389U5RbXQ/z3oHBtDjA/20Zdxc0YrWQj3jIWXzvHe05Xri4
         PzNFjo3bLx1lfPxaAx9N6HyL4ymOgxA9oZfz1yYkKbm5On7KZPuKHVvQJXCFr3glwvDv
         4Hig==
X-Gm-Message-State: AOJu0Yz9bfcRYNNdQX+Qp+yFA94V58zB6PYjIIvaq960Gk0+sWE/e1I1
	j6m1xhiGZvNGaFZZxk4z3oegQVaOY//bQj/b5eo6z0Cne3CclCJe2OfgE3nek3TR0m9+lh1K3rs
	WAZxSp+lkl0OOpVPws2mE3wYuQk9CaER/9slakFbAgVRsWrHJTPPdfMw=
X-Google-Smtp-Source: AGHT+IHz5pnLZEAp7h2N2AZsJ+PS35Tdtz+c+oMZSPv0IivDzTqDvtXt5O3knLVOLUsLmZjlJzzfLhxxSrSnbMDawY0=
X-Received: by 2002:a17:903:184:b0:1e3:d11b:532b with SMTP id
 d9443c01a7336-1ed2dbe6fa6mr150615ad.5.1714674727611; Thu, 02 May 2024
 11:32:07 -0700 (PDT)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Thu, 2 May 2024 14:31:51 -0400
Message-ID: <CABoTLcQvFfJPhM=W12Z-QnqRzkRt5TE+g0vunw4MB=aYuo-GPA@mail.gmail.com>
Subject: ipmitool fru write 0 - does not update "baseboard" FRU
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ed Tanous <edtanous@google.com>, Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone

tl;dr - Attempting "ipmitool fru write" with an input file that
contains additional bytes beyond the actual FRU data does not actually
update the FRU on OpenBMC at head w/ entity-manager.

Details:

I ran into an issue with updating the "baseboard" FRU (0), which is
stored as /etc/fru/baseboard.fru.bin. However, I don't think this is
specific to FRU 0 and could apply to other updateable FRUs in the same
way.


1. Start off with a "minimal" /etc/fru/baseboard.fru.bin which just
contains chassis type (that's required for entity-manager's fru-device
to recognize the file.

root@akita:~# ls -al /etc/fru/baseboard.fru.bin
-rw-r--r--    1 root     root           512 Sep 21 05:21
/etc/fru/baseboard.fru.bin

root@akita:~# hexdump -C /etc/fru/baseboard.fru.bin
00000000  01 00 01 00 00 00 00 fe  01 01 17 c0 c0 c1 00 a6  |................|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000200

root@akita:~# ipmitool fru print 0
 Chassis Type          : Rack Mount Chassis
 Chassis Area Checksum : OK


2. Prepare a FRU file with additional data, e.g. with frugy:

(frugy) osk@osk:~$ cat demo.yml
ChassisInfo:
  type: 23
  part_number: '4711'
  serial_number: '12345'

(frugy) osk@osk:~$ frugy demo.yml -o demo.bin

(frugy) osk@osk:~$ ls -al demo.bin
-rw-r----- 1 osk primarygroup 24 May  2 13:51 demo.bin

(frugy) osk@osk:~$ hexdump -C demo.bin
00000000  01 00 01 00 00 00 00 fe  01 02 17 c4 34 37 31 31  |............4711|
00000010  c5 31 32 33 34 35 c1 d0                           |.12345..|
00000018

Note that frugy generates a minimal binary by default. However, other
processes may not and instead produce a fixed size binary blob. This
happens, e.g. when performing "ipmitool fru read" which returns the
whole contents of the underlying storage. A subsequent "ipmitool fru
write" with that blob will fail as explained here.

To simulate this here, increase the file to 256 bytes:

(frugy) osk@osk:~$ cp demo.bin demo-256.bin
(frugy) osk@osk:~$ dd if=/dev/zero bs=1 seek=256 count=0 of=demo-256.bin
0+0 records in
0+0 records out
0 bytes copied, 5.1138e-05 s, 0.0 kB/s

(frugy) osk@osk:~$ ls -al demo-256.bin
-rw-r----- 1 osk primarygroup 256 May  2 13:57 demo-256.bin

(frugy) osk@osk:~$ hexdump -C demo-256.bin
00000000  01 00 01 00 00 00 00 fe  01 02 17 c4 34 37 31 31  |............4711|
00000010  c5 31 32 33 34 35 c1 d0  00 00 00 00 00 00 00 00  |.12345..........|
00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000100


3. Write the newly generated FRU:

root@akita:~# ipmitool fru write 0 demo-256.bin
Fru Size         : 512 bytes
Size to Write    : 256 bytes

Wait ~10 seconds for the fru-device process to reload the contents.


4. Re-read the FRU contents:

root@akita:~# ipmitool fru print 0
 Chassis Type          : Rack Mount Chassis
 Chassis Area Checksum : OK


5. For comparison, write only the minimal FRU:

root@akita:~# ipmitool fru write 0 demo.bin
Fru Size         : 512 bytes
Size to Write    : 24 bytes

Wait ~10 seconds.

root@akita:~# ipmitool fru print 0
 Chassis Type          : Rack Mount Chassis
 Chassis Part Number   : 4711
 Chassis Serial        : 12345
 Chassis Area Checksum : OK


I dug into this and found that this is caused by an interaction
between https://github.com/openbmc/phosphor-host-ipmid/blob/master/dbus-sdr/storagecommands.cpp
and https://github.com/openbmc/entity-manager/blob/master/src/fru_device.cpp.

Here's what happens:
- The "ipmitool fru write" request is handled by storagecommands.cpp
ipmiStorageWriteFruData.

- ipmiStorageWriteFruData receives the whole FRU blob from IPMI across
several calls. On the initial call, it requests the current FRU blob
via D-bus from fru-device and caches it in the process. It then
overwrites sections of that cache with the received data from IPMI.

- ipmiStorageWriteFruData uses information from the FRU header to
check whether it received all the bytes that make up the new FRU. Note
that this could be fewer bytes than the size of the cached blob. Once
it receives all the bytes for the new FRU, it calls
/xyz/openbmc_project/FruDevice WriteFru via D-Bus with the full FRU
blob (i.e. the full cache with modifications on top). After that the
cache is cleared.

- The D-Bus call to WriteFru is handled by fru_device.cpp writeFRU. It
first performs a sanity check and then writes the blob to the
underlying device (or the /etc/fru/baseboard.fru.bin for FRU 0). It
subsequently calls rescanBusses() which actually executes after about
1 second.

- Meanwhile, "ipmitool fru write" continues to happily send additional
bytes to ipmiStorageWriteFruData (as in step #3 above). Since its
cache has just been cleared, it retrieves the current FRU from
fru-device again. However, since that has not yet completed
"rescanBusses", it actually received the original FRU again, not the
modified version. The above cycle repeats, but this time the original
FRU with additional modifications from the additional bytes.

In the best case (if the new FRU data is larger than the original FRU
data), the result is that the FRU did not get updated at all, since we
effectively just wrote back the original FRU. However, if the new FRU
data is smaller than the original FRU data, this may result in
corrupted FRU data to be persisted.


I was trying to figure out how to best fix that, but couldn't come up
with a design that would still work. Some ideas:

A)  I think what we're missing is feedback from fru-device to ipmid
that the FRU write operation has actually completed and the FRU data
was re-read. The ipmid should probably not accept any additional write
requests until the previous write request has completed and the new
FRU data is available.

B) If ipmiStorageWriteFruData cannot detect the expected size of the
FRU data, it relies on a timeout to eventually write the blob if no
more data was received from IPMI. I wonder if this mechanism is "too
clever" and we should simply always just wait for the timeout?

C) ipmiStorageWriteFruData clears the cache immediately after WriteFru
was called. Maybe we should keep that cache around until the timeout
expires?

Thoughts?

Thanks
Oskar.
