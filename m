Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E786D54E0E9
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 14:38:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP1tP5zMyz3bkW
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 22:38:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OPxRkc7P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OPxRkc7P;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP1sz4kKJz3bZc
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 22:37:59 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id n185so693071wmn.4
        for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=57ksFhbU8S0ngaLinpUFfZGBIWAYfzQmiw4BGe3+V/E=;
        b=OPxRkc7PkSdywehrPkFH0QAGIRcVF6KZtiM5Mkxu1NMSjfg/BqniBc72W3GDcE5yKi
         EQpKEW63G0pShmArGA744bnN4t1s/rFkFL2RCNwT1jRVdRXY8ZP6hbV3/x394eRzt7X+
         cQB1SmZK01obGaT+0QHf6Nqk+ssM79hEz1X1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=57ksFhbU8S0ngaLinpUFfZGBIWAYfzQmiw4BGe3+V/E=;
        b=0BeatQK7QXV/cbFmgbSD0o0+teA2nY2ZLHWG3gIlesOwCW5vDYbieESkg6d711aCpu
         nUso0AwKaIbsK70esXp6qG3A11F+L2nmk6NWb2tJGj4Z638DJH0NTOYVdq16tLt8T1iE
         5ruXTfx6tNLTB6SBi7eP4jxgKbPp32U13kVsW9YCPUDRVvPJNd1B0VlV7D0pF8draGqd
         ZbCwBv5Qo08t3LUPhJDI1qqNlZSf/LwEzrpCUBaUi573dUXxKdYdWswJ8eumvYgzvLtk
         Zgf1SrMy4m08fFVw208mg/xvo4GxZRBJ4rIDPqsInD1kI1HDI9gfDrOq4MJRGB+jyU/v
         kxFg==
X-Gm-Message-State: AOAM533ETqnCSBTyjXs4iPWnDVmieO6bZLgxDTzeSPoBczBQyv+ktYK3
	nkgFLg0bBi6Q61SNk0ly3rEh+a5156FPRckPCD7C/3lb
X-Google-Smtp-Source: ABdhPJzJqGgSeRLp/VcPPmfCb8n1iUsfuYw/hFP5+sV2Yh4dWYYAZjJWmAY65lnqUfb/RN1zVjmsL6OVGZqMrw4FOHs=
X-Received: by 2002:a05:600c:1990:b0:39c:81f0:a882 with SMTP id
 t16-20020a05600c199000b0039c81f0a882mr15358231wmq.72.1655383075400; Thu, 16
 Jun 2022 05:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220610080059.2333501-1-joel@jms.id.au> <20220610080059.2333501-3-joel@jms.id.au>
 <47a4d682-99e9-e597-6998-9ab167c7b394@kaod.org>
In-Reply-To: <47a4d682-99e9-e597-6998-9ab167c7b394@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jun 2022 12:37:43 +0000
Message-ID: <CACPK8XeUo5NHNt3cAFTQzharEYDgM+EzheDLb2JRAE=1mzJ88Q@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/4] phy: Only create NCSI
 PHY when it's present
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 at 08:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/10/22 10:00, Joel Stanley wrote:
> > phy_connect would unconditionally create a NCSI PHY device if the drive=
r
> > was configured.
> >
> > By detecting what the phy type is at runtime we can support NCSI and
> > non-NCSI system with the same defconfig,
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Merged, thanks.
