Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B004C0B38
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 05:40:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3NdL54MFz3bTT
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 15:40:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eyOfnPKt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e31;
 helo=mail-vs1-xe31.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eyOfnPKt; dkim-atps=neutral
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3MGK5K8Nz2yK2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 14:39:03 +1100 (AEDT)
Received: by mail-vs1-xe31.google.com with SMTP id e26so1805295vso.3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 19:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LvRpWJinftwqb1VQH9ytrPGNaXqDypv0JPsj78l9+FY=;
 b=eyOfnPKtUVgM0Mz7hg2JjW4Pk/cOsbb3Md/CMGUoOB6YmvT4mWNt+HKzTz4ai5IMj4
 NnyWY5PzJxHtn1xXyW2OPkEgSG7DYn+zaC9ZWRwjK2jqiJN8Yugp+oKw+re8Q/0Lfr+q
 /aB+Lz0oBq9VJvVBsKnlUhFITt66Pm4TQgrAD6o5HJm98Lbe/iRriGEiN+vZvfTLMlQf
 3P53F77Zyl3kNK4bGdYDdawYfykRZcz0M7zYJSi6sMGRcKEyuQMqN3+SydppMRGUmwL+
 d6KCoMSQX+abiZ7sWPWU29QNTpYf0uobYQSCeABP5bxxfvMytyScizk4f+vb8nMa2+5S
 mnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LvRpWJinftwqb1VQH9ytrPGNaXqDypv0JPsj78l9+FY=;
 b=CmasTiBow6XBTHHFFScuXARVDf13OfGLVfIZ5zOj6dVd1S2z7qji+BkM37xWV9qk1z
 OxUNXA1ggQsw5RHCYvB7fKgenHAmDv2TgMG9xRMb5+UtAolQEQYkrl7FPe6degn/JH2/
 lWgQsBWKtwlIbNrzK9KtDlbask/CBaVNe2AiXoJdQv8uQdsZcpO5bms8B9TQwNufQLKL
 UHScwDHlXuigEqtBfjXEV87A/b2/Nl5aRrE4ywXIfLRPfv2D9qSv9E4ItooQs2dRnlHJ
 KCObxaOmbdYb/hByGghP2B0G09AC/tj36o2AmDgnh9uSQvbOxKQmz7PKfQ4beXAgBGGR
 bz0g==
X-Gm-Message-State: AOAM533sjz03fdFkSYBWtQIUYvDVlibe04l061tnlLAEgm6gv37iw+fh
 3dyAXkiA4f1EPAzpUlzEkXhEvr5kdc/hfj2duA==
X-Google-Smtp-Source: ABdhPJz9tQfelHz+P+qJV477ABXt4WJYhC7UjoC/2gG4A4NNsfZVAU8hDEjpRLH19nxzc+D6GfYbeIYfdqQfZmCrLpk=
X-Received: by 2002:a05:6102:370f:b0:31b:60dc:4f76 with SMTP id
 s15-20020a056102370f00b0031b60dc4f76mr12203672vst.2.1645587540488; Tue, 22
 Feb 2022 19:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-6-warp5tw@gmail.com>
 <YhN8OGIR9eSCus8E@latitude>
 <CACD3sJbMZ-CT4htPUBqyswghAC+j8PgJ_z-VdA38yC+6HFrF+w@mail.gmail.com>
 <YhUIP4pvoGBUohCE@latitude>
In-Reply-To: <YhUIP4pvoGBUohCE@latitude>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 23 Feb 2022 11:38:47 +0800
Message-ID: <CACD3sJZtJ_vrd=xQQ5P1c1L8dZ9LgjZhE2-76SFyQ+jX9NPNVg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] i2c: npcm: Remove unused clock node
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Feb 2022 15:39:19 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de,
 sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 yangyicong@hisilicon.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan:

Got it and thank you.

Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B42=
=E6=9C=8822=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:59=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, Feb 22, 2022 at 10:15:04AM +0800, Tyrone Ting wrote:
> > Hi Jonathan:
> >
> > Thank you for your comments and please find my reply next to your comme=
nts.
> >
> > Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=
=B42=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:49=E5=AF=AB=
=E9=81=93=EF=BC=9A
> > >
> > > On Sun, Feb 20, 2022 at 11:53:15AM +0800, Tyrone Ting wrote:
> > > > From: Tali Perry <tali.perry1@gmail.com>
> > > >
> > > > Remove unused npcm750-clk node.
> > >
> > > You're not actually removing a node, for example in the sense of remo=
ving a
> > > devicetree node from a devicetree.
> > >
> > > So, I think "Remove unused variable clk_regmap." would be a better
> > > description.
> > >
> >
> > May I modify the description according to your input and attach
> > "Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>"
> > onto this commit in the next version of the patch set?
>
> Yes!
>
>
> Jonathan

Best regards,
Tyrone
