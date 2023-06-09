Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9CF729018
	for <lists+openbmc@lfdr.de>; Fri,  9 Jun 2023 08:38:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qcrxd6BmMz3f07
	for <lists+openbmc@lfdr.de>; Fri,  9 Jun 2023 16:38:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YfIhTRTV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YfIhTRTV;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qcrx173sVz3dwy
	for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2023 16:37:39 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f62d93f38aso1753068e87.0
        for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2023 23:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686292654; x=1688884654;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PthGqlScobiEyNAAn0tev7g/bYcHSjTrwT2fazzQ1QI=;
        b=YfIhTRTVYwd7Tts9pMvJDFZK7ufG2QIXzF8QjQnMzmsLDpuTxpjPuOBaMydTT6DyDh
         Nk9azSu7gK2zooBRnkfr814FEndVy7C7+reAnGM6RIy+NDlXTl5RNxO5rQ8+BJ8xJF0V
         SlpZysK5CnEuFjFC2imM6WRRSgOReyx0W2sfuNRohdNYOq3sYXTgLMprpbXLbwfVYdeb
         KgiV5GV4vprQDl06ftXGuOHoWTr30M4LVRgjia5CnOskvOhb+PUzx3lN+XZ9Vhf+qe8H
         EbBoXoop0fsBpC8j3AIOK7IqK85iyrIKMldiyqqkpPMXvYyb8Y3BuZ9c3gZ4ep1XATUs
         pKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686292654; x=1688884654;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PthGqlScobiEyNAAn0tev7g/bYcHSjTrwT2fazzQ1QI=;
        b=cFuBRFEfze84mJMcW9PorBvkKErExeKvVJHgCGjgvjZ2VvcF09K1qQQfrHxsgEQxI8
         nB1blB4LbkCFg8PaK6RVczmw+/sm+x+CHC/VoTGdd8kLiG2KlnHzINEKoh3srZq4m1fK
         T55ng42aOQkj+V79z/6spdM+wUjT9AO7DGzHb2Y9r0pffyCiekawxIJuMHTVXIuI5DWF
         pKj8OIOKatVmKcMgdSR5A5elIxc92h4y3vqkPRQ0XG1aMkDefuNNIarXnjJ5A2q3ic2D
         mHNgABfFXLYCLE6TMui42CTL5NrAXzc/rBu/+9pdLqz78Fli85Vx6AiibrwshqxHK5Sb
         wnrA==
X-Gm-Message-State: AC+VfDwScmTGfUO+SK88TL4YPr9AJS9uMRe1GDfD41EohooHGkHY+p8U
	kJcz6DSoLPFjOqctr1uS7lA=
X-Google-Smtp-Source: ACHHUZ4FSXeAys2A22D0a5q6MSlzgqnw4UGxGF6TcAeuiBgMZYKrLsrbQ98PycUJ5bWiuh0I8RUIEQ==
X-Received: by 2002:a19:505b:0:b0:4f6:2229:b6d0 with SMTP id z27-20020a19505b000000b004f62229b6d0mr225999lfj.40.1686292653644;
        Thu, 08 Jun 2023 23:37:33 -0700 (PDT)
Received: from [100.119.6.112] (95-31-191-175.broadband.corbina.ru. [95.31.191.175])
        by smtp.gmail.com with ESMTPSA id c18-20020a056512325200b004f4cae38a1dsm430694lfr.223.2023.06.08.23.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 23:37:32 -0700 (PDT)
Message-ID: <5b277b0b61ab54060749975ec12aa2422d4427cb.camel@gmail.com>
Subject: Re: OpenBMC Network Route Management: Metric and Static Route
 config support
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>, raviteja bailapudi
	 <raviteja28031990@gmail.com>
Date: Fri, 09 Jun 2023 09:37:32 +0300
In-Reply-To: <ZIEpSaXg4IkZ7MZk@heinlein.vulture-banana.ts.net>
References: 	<CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
	 <2d93fd2f-bde5-22f2-373a-63398963e94f@linux.intel.com>
	 <CAM4DKZkvHE6AOgpaO2bCKgK9CgN_YZM9UpEDpzD3-+DSXf4EXQ@mail.gmail.com>
	 <7230376b-c7f4-b931-faff-27a4da1b38a9@gmail.com>
	 <CAM4DKZ=-pHzz-OuOyszYmrHMWog5uNpB-S4mQtQaVrY2iJ5=BQ@mail.gmail.com>
	 <ZIEpSaXg4IkZ7MZk@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
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

On Wed, 2023-06-07 at 20:05 -0500, Patrick Williams wrote:
> On Mon, Jun 05, 2023 at 07:49:06PM +0530, raviteja bailapudi wrote:
>=20
> > Gentle reminder for the feedback on Static route feature
> >=20
> > Here is DMTF redfish PR to enable redfish static route
> > configuration
> > https://github.com/DMTF/Redfish/pull/5464
>=20
> How are we suppose to review a private PR?
>=20

I'd glad to look at this PR too, at least there is multiple proposals
in gerrit about that theme:

https://gerrit.openbmc.org/c/openbmc/phosphor-networkd/+/63619
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61641
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/60448

Is it possible to put it in redfish forum/mail list/gerrit?

Thanks.
