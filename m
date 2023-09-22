Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 705827AB29A
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 15:22:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W3lPaI4j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsXy92WXkz3chT
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 23:22:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W3lPaI4j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsXxX5hpmz3cbn
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 23:22:23 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3aca1543608so1322705b6e.0
        for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695388940; x=1695993740; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJHebXIydsjsM53gQWXD6sIiFm1juqSa1zihwQLXl2g=;
        b=W3lPaI4jroVs3NPf1So3o1MnUFkEwmCrddNeAlQqr8wG+CJpeU+5UUwp67VG0Uc6Er
         cP5J95a0WLcMI8KEHTdGjJfpsbOdKS1a6cnFauza9y9cT2tt4LZB3v9672sFqjVP+WiE
         NBPkKzGgkhQJdzr14yc7ZwajPGYf8UF4qDv5VWbgGPSB60V5Pbkq6qNC49fYoI86OtHw
         2XJko0aCMF18HOx76OPnt3RFOhQzaTEhta6Ge4Yn3q00EpNkcZWsVyDCyq4JNbQJhOjj
         PObX76d7MFrMIMBxP1VAOU6PqUN1VAKsNdusSiPM+cn55DaGgi1Vd0S7+fdoc4sSIC9P
         ohng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695388940; x=1695993740;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJHebXIydsjsM53gQWXD6sIiFm1juqSa1zihwQLXl2g=;
        b=icAgjyzs9hjd6vyFyyU2A1N54NWOD6fJvltjV3Mii3EFhP6DGKGYl/4S1iHSiLI18H
         RUFhesicz3bQXOWFDEGmYelzL0l+r/J6RnfFVfoJfEHGAMXBuIe60kDeHu7p7Q4qUxVI
         TSdrfxwKJSz0cE5NuGO6jGAh01hK/ARxfJ0qtIaPIKG7p1ZGC4brgwWlSlBU6t9h2XKX
         koThlLCunp9NcJMIpzznwljrm/rUeQ0ZU+tnfdUm+ry7z9bEjpvK6hA3lEgfaPRz02K+
         hIZaPsJ0FCweQnR7Zqu2zdk655OIbYD8oyHJhzP6FOtbb4KOgjb2jWDi7Zln1ZhgE3Vx
         lt+w==
X-Gm-Message-State: AOJu0YxRC8/3opmm3iMOZDtE4JWSP2/W6J7fcLjnmOjKrOxG2TEFupuy
	FfwqXpYntw0NgH7dRLvBOe3M6gSjaOc=
X-Google-Smtp-Source: AGHT+IEtDo265m/iQH4bUTjBbk+CcQ44JW87/lrJXRKaOQ5PQmdQxImrVtp03tkyHzBTJi5Md7iZDA==
X-Received: by 2002:a05:6808:112:b0:3a7:9e15:fbfb with SMTP id b18-20020a056808011200b003a79e15fbfbmr8196137oie.9.1695388939702;
        Fri, 22 Sep 2023 06:22:19 -0700 (PDT)
Received: from smtpclient.apple (cpe-70-112-166-205.austin.res.rr.com. [70.112.166.205])
        by smtp.gmail.com with ESMTPSA id bx9-20020a0568081b0900b003adcaf28f61sm772308oib.41.2023.09.22.06.22.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Sep 2023 06:22:19 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: OpenBMC Linux 6.5
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CACPK8XcjcxefBL3rhx3f_TPO-TRtkxTUP07qvRniFJS4dmaNPQ@mail.gmail.com>
Date: Fri, 22 Sep 2023 08:22:08 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <E6DC810A-E016-4B56-8BE9-16CEFDDB40AB@gmail.com>
References: <CACPK8XcjcxefBL3rhx3f_TPO-TRtkxTUP07qvRniFJS4dmaNPQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3731.700.6)
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



> On Sep 22, 2023, at 2:04 AM, Joel Stanley <joel@jms.id.au> wrote:
> 
> I'm moving the kernel tree openbmc uses to a 6.5 base for ASPEED.
> 
> +1 party is here:
> 
>   https://gerrit.openbmc.org/c/openbmc/openbmc/+/61083

I think you meant this link for the +1 party:

https://gerrit.openbmc.org/c/openbmc/openbmc/+/65884


