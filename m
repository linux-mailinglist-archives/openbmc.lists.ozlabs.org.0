Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E17E33F401
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 16:36:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0vQn0ymXz30NC
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 02:36:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TFlh/WEA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TFlh/WEA; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0vQY3jctz30C0
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 02:36:36 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so2167744otn.10
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q1V2xnOA7Zetf69I1SZwTP2LXEDzVjPEPxOGeGgyRSY=;
 b=TFlh/WEA4Ex5MbYhwM5PG7BwiKGe8NpvI/sM2H29b947yBSjGA2irUtCJbKVCDsgTv
 yEbnZc1QO+QLza7VgngeXemDXmQ6YzBiO9ER80pd6O40bIqsAnaSLzptRweTGxmH0qd9
 AGoH3O6n9sgtbzKPH9DS9GSoOjqPyprN39BNblGHI9rhSx2+wEOMPwzVedtD3Fwp4+/D
 SK/57wCpmk89Yp/jEJVEW6trXIpYvb2+3v/pZoUuMFMfdhTR2a8h7bogKpvxpJcYRiDC
 U7mhh7W8hYTIXySX2SMUIfRi3bcJ0wID2QQX6wbI6lKl6FTiRx2ZnkWXbF88FErlTryN
 IBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q1V2xnOA7Zetf69I1SZwTP2LXEDzVjPEPxOGeGgyRSY=;
 b=Ugd8Tg+6Cq8OryJunpgwXKGymO1RctM/T5ne+L4pNnORyT0ITxNAqTQdrO2zgys2mC
 giD6LPqkSTuF7M91mB3u/4NhF0s5ZyNC/5bGJGsqidApQ8swwTnJqCROvR7Bp59cHVgo
 dNFj0GZJo4NmWuNlxK1lxAXA8xshzQirguBRtwoEDef2yiqbI+6T9QokJDzhwiJzNR89
 9rpnbn5zH0iCPxi685+H3Fd0ygss4yUtzH3QlcljKkwIeIBF2I9I46iKpouyeurIxPWe
 26Qpl+X0zAvPy8RkUD4cp6RfWjY3nZqp0irIVBwUXgdonabUIOZjvPM+d7Ht/7QPp9LF
 QEEQ==
X-Gm-Message-State: AOAM531IHywR55gBhN4xuMdd6lhZCnOe/bXzdHe1Yh7vim19Ytp4JuPM
 H3vN7OIvP88xOwht8bC2AJ0=
X-Google-Smtp-Source: ABdhPJxkalCdVnJ/pvNlZWcGTBfBjBjHt5DztA9OdOFR9foHh239mZKlw7Yn7chHRSf+e9sktGQnJQ==
X-Received: by 2002:a9d:62d1:: with SMTP id z17mr3740009otk.118.1615995389604; 
 Wed, 17 Mar 2021 08:36:29 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:5d9f:d294:e15:6e24])
 by smtp.gmail.com with ESMTPSA id x17sm6966706oie.5.2021.03.17.08.36.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Mar 2021 08:36:29 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Gerrit trigger CI from Jenkins
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <SG2PR04MB3093BF84F15469B9F151FBE7E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
Date: Wed, 17 Mar 2021 10:36:28 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <91B8443C-5764-4177-A3D6-315C74C8B520@gmail.com>
References: <SG2PR04MB3093BF84F15469B9F151FBE7E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
To: Jayashree D <jayashree-d@hcl.com>
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



> On Mar 17, 2021, at 7:10 AM, Jayashree D <jayashree-d@hcl.com> wrote:
>=20
> Classification: Public
>=20
> Hi Team,
> =20
> I am working on Gerrit Trigger Integration from Jenkins.
> Is there any steps followed for continuous Integration of gerrit from =
Jenkins ?
> I am facing issue in connecting Gerrit server from Jenkins.
> Could anyone please share your thoughts on this.

Did you happen to see =
https://github.com/openbmc/openbmc/wiki/Adding-a-System-to-Hardware-Contin=
uous-Integration?
There are some steps there for setting things up.

> =20
> Regards,
> Jayashree.
> =20
> ::DISCLAIMER::
> The contents of this e-mail and any attachment(s) are confidential and =
intended for the named recipient(s) only. E-mail transmission is not =
guaranteed to be secure or error-free as information could be =
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or =
may contain viruses in transmission. The e mail and its contents (with =
or without referred errors) shall therefore not attach any liability on =
the originator or HCL or its affiliates. Views or opinions, if any, =
presented in this email are solely those of the author and may not =
necessarily reflect the views or opinions of HCL or its affiliates. Any =
form of reproduction, dissemination, copying, disclosure, modification, =
distribution and / or publication of this message without the prior =
written consent of authorized representative of HCL is strictly =
prohibited. If you have received this email in error please delete it =
and notify the sender immediately. Before opening any email and/or =
attachments, please check them for viruses and other defects.

