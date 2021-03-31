Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F35350110
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 15:19:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Rjb0sGhz3bt3
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 00:19:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JHusXlpL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JHusXlpL; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9RjN05jTz3bpJ
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 00:19:02 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so18881789oto.2
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=RhE1Mgj/cz80RWN+jatG4U6LYbA6awm9Se2bkQEmtKE=;
 b=JHusXlpLtx3+6a56KH8mfJaBpRlTFfnWar/dp4NWdITWpczuBB2C6DX41TNIi6KYaQ
 QuZLB7wek7/QNsAdDIdRSbU0uohlvm7Ax/2YPDEt1cStD2ObGkZnN1r3Wg5NJOYsotoG
 mWDYtcIBcuXyQt9Cr+I1EBxm8H3nXT4LxeTMwEqGgpDDVeTGI2JkiRRraEBhuST7GUyq
 J+3Ztb/amR+iWi5kBiJMSK73uplYJsyyQHrDkn3xPn865FqRHnGazJbQwkgJeF71KCka
 bxPRHZ/ShvrY5owFhriWnngVd35CbeUUKMYeenuDZRpG1qf6CQv88dByFYP5iSzury56
 wUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=RhE1Mgj/cz80RWN+jatG4U6LYbA6awm9Se2bkQEmtKE=;
 b=UONTJwakp36VY7jtZPrq+hwW9zpbDgdqglzFFDlDF/39HZtcZrGvXEnaAzqEvz3bZM
 +NqzxJgcToi1cbgq2LNYqU9XtBGAJ6t0agcdv8Jev/2jbIrd3/a+noBZWO41tnvJosz7
 IQx/Gb1vydbsLnmvn2xk1tJMS9zMolHYz0spG+QC0u1yVqHwuimCdgEVBP0LCULN4yVZ
 elTOwRIshCMD6/RS2SbVlimzU89qBNThWzMW5hFkwvprQhbac5S6CwI3iwtXUNVpBSqH
 2UbShUc4QdG0aoDkeIKCAA2o2P7dcmEqoW7YbFGHGSL78hXJxSjzHyOvQDTxSIv5FRdp
 tUHQ==
X-Gm-Message-State: AOAM5325ZQyJWHbUJfZw2XrbOpBF/Mpzhl0M/w9j6vy8ikZ6ZxHueUBy
 bXi6H21z1ISiYOZSoYqQEuk=
X-Google-Smtp-Source: ABdhPJwFrQujk3PmarVnxLsf3fk2TWBbQXOo82j2A4ZH6YhJkvL6EyWvIvSWsSIAhwkzjAZFYdAmNw==
X-Received: by 2002:a9d:628d:: with SMTP id x13mr2509709otk.19.1617196737978; 
 Wed, 31 Mar 2021 06:18:57 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:304c:83dd:7e06:d5f0])
 by smtp.gmail.com with ESMTPSA id n6sm413492oop.48.2021.03.31.06.18.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Mar 2021 06:18:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Add member into Lenovo designated employees list
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <SL2PR03MB41392EC887269BEBAF453E96B67C9@SL2PR03MB4139.apcprd03.prod.outlook.com>
Date: Wed, 31 Mar 2021 08:18:56 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9D88EA1B-4409-4BD8-A341-EAAC8FF0007A@gmail.com>
References: <SL2PR03MB41392EC887269BEBAF453E96B67C9@SL2PR03MB4139.apcprd03.prod.outlook.com>
To: Duke KH Du <dukh@lenovo.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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



> On Mar 31, 2021, at 2:14 AM, Duke KH Du <dukh@lenovo.com> wrote:
>=20
> Hi Master,
> =20
> I would like to add our new member in Lenovo designated employees list =
as below=EF=BC=9F
> Could you help on it?

Hey Duke, I noticed Lenovo was not added to the script used by jenkins =
to
validate groups so I put up a commit here for that:
=
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41738=


Currently the Lenovo gerrit group only has one person in it:
=
https://gerrit.openbmc-project.xyz/admin/groups/b009effba2bf2e62802e74d749=
db360d52c2a245,members

And no one is approved to add people currently:
=
https://gerrit.openbmc-project.xyz/admin/groups/9f33fac15a90496c21b873f5f9=
918af1a633a47b,members=20

Could you recommend someone with a gerrit account that we can add to be =
in
charge of adding new developers from your company to this group?

It does look like ritzenyang needs to be added to the Lenovo CLA though =
before
he can contribute code?

> Thanks.
> =20
> ritzenyang  ryang14@lenovo.com

