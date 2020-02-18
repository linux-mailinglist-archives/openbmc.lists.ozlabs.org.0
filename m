Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 743C116205B
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 06:25:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M8T94B9ZzDqRy
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 16:25:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NmHiLjvb; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M8S92JKMzDqRx
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 16:24:56 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id q23so5317262ljm.4
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 21:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NrfcClPJWQ4PMdlNORRBCoOXdwUE/on/QX/4CGCzGek=;
 b=NmHiLjvbcxkkE+c3x8IC3o+LbMY9omdRFfA9AHp+3Pu3SwZ9FDDl3pdEi8TVX0fUBA
 uztqcpMaB6mKB8kXkjXAde60cgLRNIt4bxTqsPPm+TDZ0v3mX/UnRBDOR+ZEeR2jdR7f
 +KBo+qB1FMSvmFxDAUiXE2p2Kwe+gdZxIVqbs/o+8KL9nVf7GmEQ1DuzP1o4EglPt3aY
 vgRTlZUOJx5tsTOp0Rl5E/eYx+YEBSmgxS5ps41U6xwx73VhdIliZU7bP2k4VVJBgBdQ
 drk3GYDszh+qtSBnlCiBvqb+RFOH5dWTSfXP7L21g41KNFB83+xTRHBYvToqRHe5BTtY
 GRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NrfcClPJWQ4PMdlNORRBCoOXdwUE/on/QX/4CGCzGek=;
 b=TNGtZEBo4N8Nirv8kz2V9aOLVKTHiBc5gKU9W9AgMXId3PmFmI5SlshxG13fuanfAz
 eZfpg68zHCV4sOfAWLb2bbyPBmRvlzTsl8A6iU5OC02tu+tKWISO1oz7gMG6GRvq20Wo
 DPg8YSbPZcdaa74HdGj5h+FeDu/zMWhMGxMSLChwkvtdc7qdCR7vQLQVVLoOWTxhfsS0
 wa9scE4sTbi6mWZFfLE1jey28+/T1DDKBpp7+RS6F1BHrB1sEoEWzG+HVGRLYi+N9BpD
 CJXp1wTbijFMQZoKwIOcyi9+k+Z6XWPslI49MXNqT30VjrmkpcMFqHr9oWrsscJh50j9
 PcXA==
X-Gm-Message-State: APjAAAX39WWiWoUObXMauXSFfCZxAsySR824mv3dDPieseB9c96id7M0
 936Tem6KMuuXl6+F8uc6yjyQ0LFFjnJnifb31YI=
X-Google-Smtp-Source: APXvYqys8J+GSviZel1naxoBtnelpNq1JtzIsCYVmYXJARRcxC4jwl128MiQ931eYNyPclkofuwKArbH/QAPqnJ56Q0=
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr11501550ljk.228.1582003492113; 
 Mon, 17 Feb 2020 21:24:52 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR02MB3427B226A660C70F479B427EEF160@HK0PR02MB3427.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB3427B226A660C70F479B427EEF160@HK0PR02MB3427.apcprd02.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 18 Feb 2020 13:24:40 +0800
Message-ID: <CAARXrtmGnAj36LgsW=NHBX0GS6FN9gt_g=UKh2n-v-xe1hhq2g@mail.gmail.com>
Subject: Re: Question for phosphor bmc code - BMC update
To: "Eli Huang/WYHQ/Wiwynn" <Eli_Huang@wiwynn.com>,
 Adriana Kobylak <anoo@us.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

+ Adriana

AFAIK the restriction is added by Adriana, she should know the details.
I think it's reasonable in production that if the revision is the same
there is no need to do the code update if the running code is already
the same version.
But it does cause trouble in lab debug that one does want to update
the code with the same revision.

On Mon, Feb 17, 2020 at 6:23 PM Eli Huang/WYHQ/Wiwynn
<Eli_Huang@wiwynn.com> wrote:
>
> Hi Lei Yu,
>
> Confirm a question with you.
>
> When we do the BMC update using phosphor-bmc-code-mgmt,
>
> The code in the image_manager.cpp will get the version in the manifest fi=
le.
>
> If the version is same as path on d-bus, the BMC will not update and prin=
t message =E2=80=9CSoftware Object with the same version already exists=E2=
=80=9D.
>
> We want to know why upstream code can=E2=80=99t update the same version i=
mage if the BMC are valid.
>
> (phosphor-bmc-code-mgmt commit number : a013560f96a9ee5c2db4e1778c7dcee19=
9c3acf1)
>
> Regards,
>
> Eli
>
>
