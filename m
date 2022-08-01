Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C72EA586FA5
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 19:38:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxQMN3VXSz2ypf
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 03:38:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tHxsooZT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tHxsooZT;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxQLy6FVYz2xk9
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 03:38:01 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 123so20080553ybv.7
        for <openbmc@lists.ozlabs.org>; Mon, 01 Aug 2022 10:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=9rCF6vfgknlgyeLhQt0k1C+MVerB8PmDnU6G9oL+NxY=;
        b=tHxsooZTwE6t5GOf+NsXxj801jVtdxDwVpShwwfPUCWfBUQ3a301+UWc8qrKxDXhzQ
         /evMnnLdNetLukA2syFBVIGO7TRkXLplVTXC2i/cn2FBuMBvDLbd2Gh3jQjgJiUz0Cd4
         mYyEUYe6g8E2pVHZHn2Gabx1AFpmFG8nEa2f0Y792+v0EF+lmjoPyOH5LoyT71U9s5hq
         X+P4JFuQPG+IdyxU8qBq8UkJIR9q59V6fQyv43FsRnGMFi4EI32EwtB1NDjyBYn0VRTI
         jh+TduJVQ7gSjitYS+oE4h7kYcUsi/Jl0QRB6QHlCvy/QchOHSYOm5MJZQKmbju3Iv0Z
         t3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=9rCF6vfgknlgyeLhQt0k1C+MVerB8PmDnU6G9oL+NxY=;
        b=4EIEwZ4YqjoSTdGKbBCf5MSmmG7sZLgaWCCHMunEiif24hHpc5lOHyEEq8XtqlZ79w
         YXrgvAarfrZkSxFgvM6j5QN+8bvl2Ueh05iaCJBvmAodOqgKHNshU5raCYrBjh1ArmNu
         AtSS3TzjVLdVru5YPtSRkIeVpahMruh8GDoyeCJ7hvF2pKwIuNRRrcXe50sQM8/2npTb
         gpTfW2cVFCNgX9aLcKXnkF6koZgIBqryv5aOXmK4UHmpWAwid2Spn6COeJQ1ojJ85num
         wc8WeIzRp+fq6pn8sbhA0S3/WKvoF2pzi5G/4CYWKxK91Xs/EbNDgf/0/gN1s7CVPiDe
         DxsQ==
X-Gm-Message-State: ACgBeo0pkKpDJE7VDn67wRZ2iqR5uTOdTzYYF9Qh7ZY9aYM+ziNPJW3c
	amGP9XRK963SFRoZ/7wrjxWb3BazrWgytEDoDzNwYrt4ynxvS85q6V8=
X-Google-Smtp-Source: AA6agR7xPyoB3WVCoZrS6XUr0Tk9dkx3R7CVwB5yrrZZIv5ZPVsLaZDqjibuJDjZwaWIcpXEdNQ0y/k31SJr5po0B5g=
X-Received: by 2002:a25:2143:0:b0:66f:f1c9:a995 with SMTP id
 h64-20020a252143000000b0066ff1c9a995mr12754857ybh.458.1659375476305; Mon, 01
 Aug 2022 10:37:56 -0700 (PDT)
MIME-Version: 1.0
From: Benjamin Fair <benjaminfair@google.com>
Date: Mon, 1 Aug 2022 10:37:20 -0700
Message-ID: <CADKL2t6YYHWfw_4jt5Z+QbEV+x+bZeVB7OnQh7cceRh=VvFEPA@mail.gmail.com>
Subject: Request to add Yocto meta-arm to OpenBMC
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
Cc: timlee660101@gmail.com, peter@pjd.dev, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In order to support ARMv8 SoCs, we will need recipes from the meta-arm
layer in Yocto[0] such as OP-TEE[1] and ARM Trusted Firmware[2]. Can
this layer be added as a subtree to openbmc/openbmc?

[0] https://git.yoctoproject.org/meta-arm/tree/meta-arm
[1] https://gerrit.openbmc.org/c/openbmc/openbmc/+/55235
[2] https://gerrit.openbmc.org/c/openbmc/openbmc/+/55234
