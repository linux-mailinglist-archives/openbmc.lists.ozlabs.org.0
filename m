Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C545E3A9C18
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 15:39:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4mVs3bzbz3c2C
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 23:39:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hnu1MYTE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=manojkiran.eda@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hnu1MYTE; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4mVZ5mv0z3byw
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 23:38:45 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id e20so2032154pgg.0
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 06:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=WpdR7pnl38ZeOLOg7jt7O/qh4KuXrJzC6Ptx6ydNrzQ=;
 b=hnu1MYTEXnWg98r/PTm1IqYiSilho48x4CESVIF/gigodzwnFWFB+sURlIQ8mNM5R3
 0/UgntOSIe6UoeqqNO39vIr1Xou2p0jMyESmpJ/yqmXBMV/aVTHBbjy7MRlPLk8fcrxm
 Sp8nbIypMw3lx9ULuuXfiI9TXxRyI2RxSjMn4A29TS9JyPr0uOqhnr4w0ElYdHUL9gcR
 mg0ORFOkWm+pBuXRlY3AJkU5KmWvuNXUJU1x72jSwtGs0S8XWXWjgvT5HoYAUpQ0syCg
 2SKM10QJfxHOX430Gtylsk6ix/4QNULHcNDgREbZpgmenIgnnW+r4jFAnabul2mwH1u3
 sa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=WpdR7pnl38ZeOLOg7jt7O/qh4KuXrJzC6Ptx6ydNrzQ=;
 b=seIm2gMHhsQ0h6tth8pWreouxVNbwCzM19XfMBzWR1mQueBC2OnQf74c2W35SDNXUh
 /HwvfZ0jCmBPQ59z+HJ0UjAraJUN6Mkk+qnNTbR33fPvxFJL/SvMT2+54uqdS2Yhbx84
 jckPpvt/vdHSF5z98XXxsbBEq/mfbY3HahHReqcplnVuPDEKc6PXWCO6g2igpbsAkE/m
 zh2ZFypVQKCDWFEKcGgsiKz7Ye/xQuvCDfBe+R03yaRdmu4hcIenPMrwTlGe2Xqx5JpV
 m0aKmF0G8V5t/Y9s7eItMzX0y9zpHkcIV+lgVb50avoYdNWAT+L22gcZLf7qUL8qPDFW
 fHzQ==
X-Gm-Message-State: AOAM533ChQJlxPZv4x2Q7707250QoKBKXnQRbMwVKgDGFWlYGPR3wZOj
 fx0rK+T4Y2IAVPBl8BKzjCo=
X-Google-Smtp-Source: ABdhPJyR2ew9cPkch1dkZjUveWVcZa521LIIhYjFhVD8LxgUpeyIqMqjLKwFFNB1qq5SgIBA5rQqWw==
X-Received: by 2002:a62:834f:0:b029:2f2:9935:8fcb with SMTP id
 h76-20020a62834f0000b02902f299358fcbmr9521225pfe.68.1623850722882; 
 Wed, 16 Jun 2021 06:38:42 -0700 (PDT)
Received: from li-fc25694c-34d6-11b2-a85c-eabe43530b30.ibm.com
 ([183.82.152.102])
 by smtp.gmail.com with ESMTPSA id i14sm2412621pjv.15.2021.06.16.06.38.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jun 2021 06:38:41 -0700 (PDT)
Date: Wed, 16 Jun 2021 19:08:38 +0530
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <E74141E0-4D17-42F0-A7FA-6752BAA522B7@getmailspring.com>
In-Reply-To: <dd89f391-87c3-9712-9423-0682fd3b5aad@os.amperecomputing.com>
References: <dd89f391-87c3-9712-9423-0682fd3b5aad@os.amperecomputing.com>
Subject: Re: dbus command to set POSTCode
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Thang,

On Jun 15 2021, at 9:49 am, Thang Nguyen <thang@os.amperecomputing.com> wrote:

> Hi,
> 
> I found the command to set POST Code to dbus as below:
> 
> busctl set-property xyz.openbmc_project.State.Boot.Raw 
> /xyz/openbmc_project/state/boot/raw0
> xyz.openbmc_project.State.Boot.Raw 
> Value \(tay\) 0x080103050006 72 2 0 0 2 0 0 0 72 0 0 0 0 0 0 0 0 0 0 0
> 0 
> 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 83 84 65 78 68 66 89 32 32 32
> 32 
> 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32
> 

Looking at the command, This looks like a command that is used to set
the progress code value on IBM machines.

> The first option is the POST Code to set. In this case I use 0x080103050006.
> 
> However, I have not found any document to specify the remaining.
> Anyone 
> has document to specify about arguments for POST Code setting in dbus?

Earlier, the Postcodes used to be just a uint64 number, But it was
recently changed to `struct[uint64,array[byte]]` to capture IBM Progress
codes[1] which are bigger than just a uint64 number[2].

IBM Progress codes structure typically have a primary code(uint64) which
is used to capture the progress towards boot ,and a secondary
code(array[bytes]) which is used to debug boot hangs to provide
additional details regarding the problem.

On Intel systems, the snoopd daemon that is responsible for setting the
Value property[2] would just set the secondary code to an empty vector[3].


[1]. https://www.ibm.com/docs/en/POWER6/areai/areai.pdf
[2]. https://github.com/openbmc/phosphor-dbus-interfaces/commit/9a96970ebb93eb1f495c200801343a4d1c53977c
[3]. https://github.com/openbmc/phosphor-host-postd/blob/master/main.cpp#L68


Thanks,
Manoj

> 
> 
> Best Regards,
> 
> ThangQ.
> 
> 
> 
