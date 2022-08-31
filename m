Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDF15A734A
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 03:22:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHRHP60VVz3c1G
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 11:22:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=R/zRMpeQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=R/zRMpeQ;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHRH15Ljnz2xJJ
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 11:22:05 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id az27so16326876wrb.6
        for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 18:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=B8qOCB008bzkGmyeKKSx8QgzN2xxk2FyfJM736ZSJNQ=;
        b=R/zRMpeQfrjovn7mgdQpkt0V2JtC0Ho/6UqXoDAY/APy9mHEchb7XSe+ajpBY79hKh
         a7vMdJSeUiUQzKk1G5IVDtOF96Z9Qlw33XRfyOH7WHDmMLoUVJ1hc6K4nBiyj6wNdaPI
         j5EAMRfnVvTj1wwcxEfUDBQGUZ+6nD5dmVLQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=B8qOCB008bzkGmyeKKSx8QgzN2xxk2FyfJM736ZSJNQ=;
        b=CKu9DjjeqTPzEh4n+/CgJx91gfWjpmRG2VUDX8+Qfj0nREbn7YUNi0Z7fWtKMQ9vwq
         xMIS5aUrNPHtk2BuqleRRvEJzaKztHgOG7ucujSaNfPEajcq09OxbYtXotELzEcrYNyd
         SzSSMb4+VgbQ7o58ZqMbzYN1brcNV8T8hwanrBcgpBMHmsAJa7IQ1q4HSBmYyLw8q9lU
         l+UEvg/N1Gze+pMJrCwmCbhjqfssY/jLnrqB2Aia9w56mK9HzOFftfKa+wIr1b3MpUYM
         5l87D5ouS75/uhce00g12PrSMqF7qHTWGpcDLKXvQIkynaII3USjXPg3yJnjSiLVhLpi
         00yg==
X-Gm-Message-State: ACgBeo2b1lMHtxfxCk5444P23rlIaLtqs1513kZvY8SctzH/T8hRda8T
	d2SnxHcsGCFHwW7iaQ9m8ezm9rP4uDig0jiutPPOxnfX
X-Google-Smtp-Source: AA6agR7X+2kuqrXVHBYBNCZBSzgKMA1CBKRfydKxGlvPb+JXltruqpc/aToQuZEmUXNDG9At2u++9Us80wD6ZK4wGO0=
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id
 i8-20020a0560001ac800b002206af3935dmr10402669wry.549.1661908917242; Tue, 30
 Aug 2022 18:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <166190001339.271991.6991052484622099743@amd.com>
In-Reply-To: <166190001339.271991.6991052484622099743@amd.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Aug 2022 01:21:45 +0000
Message-ID: <CACPK8XfYKRYO3fdqjN7H-C-KZwoQFDGOcnL=OZgvjGQVXgisCg@mail.gmail.com>
Subject: Fwd: [ANNOUNCE] QEMU 7.1.0 is now available
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The new qemu release includes some good stuff from many openbmc
contriubtors, in particular for the AST2600 family of SoCs.

Thanks to everyone who has worked on that, in particular to Cedric for
his careful review and maintainer work.

---------- Forwarded message ---------
From: Michael Roth <michael.roth@amd.com>
Date: Tue, 30 Aug 2022 at 23:01
Subject: [ANNOUNCE] QEMU 7.1.0 is now available
To: <qemu-devel@nongnu.org>
Cc: Richard Henderson <richard.henderson@linaro.org>


Hello,

On behalf of the QEMU Team, I'd like to announce the availability of
the QEMU 7.1.0 release. This release contains 2800+ commits from 238
authors.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/7.1

Highlights include:

 * Live migration: support for zero-copy-send on Linux
 * QMP: new options for exporting NBD images with dirty bitmaps via
   'block-export-add' command
 * QMP: new 'query-stats' and 'query-stats-schema' commands for
   retrieving statistics from various QEMU subsystems
 * QEMU guest agent: improved Solaris support, new commands
   'guest-get-diskstats'/'guest-get-cpustats', 'guest-get-disks' now
   reports NVMe SMART information, and 'guest-get-fsinfo' now reports
   NVMe bus-type

 * ARM: emulation support for new machine types: Aspeed AST1030 SoC,
   Qaulcomm, and fby35 (AST2600 / AST1030)
 * ARM: emulation support for Cortex-A76 and Neoverse-N1 CPUs
 * ARM: emulation support for Scalable Matrix Extensions, cache
   speculation control, RAS, and many other CPU extensions
 * ARM: 'virt' board now supports emulation of GICv4.0
 * HPPA: new SeaBIOS v6 firmware with support for PS/2 keyboard in
   boot menu when running with GTK UI, improved serial port emulation,
   and additional STI text fonts
 * LoongArch: initial support for LoongArch64 architecture, Loongson
   3A5000 multiprocessor SoC, and the Loongson 7A1000 host bridge
 * MIPS: Nios2 board (-machine 10m50-ghrd) now support Vectored
   Interrupt Controller, shadow register sets, and improved exception
   handling
 * OpenRISC: 'or1k-sim' machine now support 4 16550A UART serial devices
   instead of 1
 * RISC-V: new ISA extensions with support for privileged spec version
   1.12.0, software access to MIP SEIP, Sdtrig extension, vector
   extension improvements, native debug, PMU improvements, and many
   other features and miscellaneous fixes/improvements
 * RISC-V: 'virt' board now supports TPM
 * RISC-V: 'OpenTitan' board now supports Ibex SPI
 * s390x: emulation support for s390x Vector-Enhancements Facility 2
 * s390x: s390-ccw BIOS now supports booting from drives with non-512
   sector sizes
 * x86: virtualization support for architectural LBRs
 * Xtensa: support for lx106 core and cache testing opcodes

 * and lots more...

Thank you to everyone involved!
