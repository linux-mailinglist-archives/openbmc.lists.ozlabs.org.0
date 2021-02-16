Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE131C65F
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 06:27:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfqHJ65wPz30N5
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 16:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lHsulLXj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lHsulLXj; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfqH52hzbz30HP
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 16:27:27 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id o21so6419991qtr.3
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2021 21:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6Zv4KrDU38ixL+pUgd2dR5skJEcAZK0BEkD/0PJtHEI=;
 b=lHsulLXjd9Om+1xIToNhQ7meJ/ikiPU7S00pIJ2QNCu40UbruaLV88oSsPmg59CoYV
 lygvMbBQt+Zyy/W1EwN8j4BL9acCrvUWJ+Rhcp4s6Gid2yvfr9fFkK+bu+1k943V5RHg
 ilxGeqjahNqZJmcg57xYMhUVzGNyTkegzspoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Zv4KrDU38ixL+pUgd2dR5skJEcAZK0BEkD/0PJtHEI=;
 b=ZLZE4GLR0Knl6TMqq59yYzy9e6CcPNPndSZBf92ZrLZ+QkoaTNetZBPMZcm74uuiMV
 nnDtlExP2XWAtsv3kEQZOPq5I5gb1n0RzY0Nv9YGreifIPD7GlLZrXGWiIFSYOoo1IKx
 MCQsHoZIP6VQjnql4pV+zxcnIauTbBUrXSnPoU4GCjxywSOJyWPDx24u9Xc+xUiai4M3
 2cbGNLQBu99dDqgjQtBlcj4ij/NLZkgiJ4xbNtRnC0yrUi0asSPMo8M5UI2krqMy31Xa
 jtGIKngxvL5bQdhHeCoEZX+d8py43LL1njo2kcu2tqpv8/LURVX2TXQNoElXP6m615wU
 Jdfg==
X-Gm-Message-State: AOAM531YTpgM8/UP3meZ/0w4sywE6nckvgYm7EUL6xfMHdW1D+ciYlZy
 HZjDr5JQ4X7IvJtgNhstoivCE78WkKhCTqk3afs=
X-Google-Smtp-Source: ABdhPJxIK02ocP0ErqT30o6OnMs/eX5rLv3P+/eIaBIsePEtcEg8mn4IWfZNKMD2l3GkvThkUrgJXQZ6LRnjaTa9DUw=
X-Received: by 2002:ac8:47c8:: with SMTP id d8mr17362584qtr.385.1613453245770; 
 Mon, 15 Feb 2021 21:27:25 -0800 (PST)
MIME-Version: 1.0
References: <172B3E99B822FF48BA79AD354B1F1F59027BE00DC6@atlms1.us.megatrends.com>
In-Reply-To: <172B3E99B822FF48BA79AD354B1F1F59027BE00DC6@atlms1.us.megatrends.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Feb 2021 05:27:14 +0000
Message-ID: <CACPK8XeNADMmjQZfUFK3d1rsTCUZAM96FoRO_9t8e1eVzi_68w@mail.gmail.com>
Subject: Re: U-boot version for AST2500
To: Pravinash Jeyapaul <pravinashj@ami.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 16 Feb 2021 at 04:45, Pravinash Jeyapaul <pravinashj@ami.com> wrote=
:
>
> Is there any specific reason for using v2016.07 u-boot for AST2500? Why d=
on=E2=80=99t community use v2019.04 for both AST2500 and AST2600.

Even better would be to use mainline u-boot's latest release.

The reason it's in use is no one has found the time to move the
existing machines to a newer u-boot, and test they still work. I
welcome anyone who can make progress in supporting the 2400 and 2500
machines with a newer u-boot tree.

The steps would be:

 1. Get a tree that works on the 2500
 2. Create an openbmc configuration for the NCSI and direct-PHY
systems. Ideally we could use one build with device tree to configure
them differently
 3. Ensure this configuration works on hardware and in our qemu model
 4. Update the tree to use them

Cheers,

Joel
