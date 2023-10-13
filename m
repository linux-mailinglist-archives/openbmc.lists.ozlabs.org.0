Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 423CF7C7B20
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 03:20:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Q1QP2+zm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S67ws1Q4Bz3cBH
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 12:20:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Q1QP2+zm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S67wF4LBPz2ytJ
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 12:19:55 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50307acd445so2003054e87.0
        for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2023 18:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697159988; x=1697764788; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OeQN8A1b3apIIzvKmd5I2fRy3O9FL+0AF7zpFAbY1Ew=;
        b=Q1QP2+zmGsLApAShGSlLz8Sk7ylGinYljhth+e7nKX2yFoLNJG6tBK1YE9EpB0XVzS
         CvoVRB4WnuJBezn3nb8HSIobIBu6TB9bwA/JQl7FnPK9V2XFe7alhYq+J2laBYJ+JT/R
         190B7+/3o5GkkRxpG24iyXOZsadsIxccqQ35k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697159988; x=1697764788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeQN8A1b3apIIzvKmd5I2fRy3O9FL+0AF7zpFAbY1Ew=;
        b=SKlVEX+zu6RxMynq8ofHGFFtRwOov3uTEBAhNOSjjontfIlTgzkuU1gM8KcSxO2FL9
         Ow7YEfYjJeuYuEYNo6JOvSpBHzQ4vENFzXAF+UXRvjQ7bsqPslmSq9+uSc27kSRbhA+y
         tlYPrAJVnxwndLzB7nF0Q8tZF3LWATgMT/pk+dMt3xaaMD2gMGwWXO6CXdW5T2Sotd00
         DNcWQzJvTO3KcBlGcF2Wiy9PLbOxFxWX6b9fp/btLgqBaphFiZ6avguyUII0NiGA/WPx
         MmRc/MP3xHDddLm2KuZUSarMvy4RL5akas+sJi/mpoiKtjXvX0I6XZPQIRZ/4O61tq54
         nHBQ==
X-Gm-Message-State: AOJu0YxMTubXR5NG4XlZUWLIM8mOCkyjcIsJwYp7muKVNICQWTD4GjKF
	EY0CKLsEunT3M28ecOxJVIarBgqNf4F7AiTZvVM=
X-Google-Smtp-Source: AGHT+IH5kT3Ffc8aZZrsInyOITLAJ3XnNqCz1J1stHo/MVin+v0fhGUyErHXu9RtNOamERqW0UrkUGyHPgkHiyxwsEU=
X-Received: by 2002:a19:6d1a:0:b0:4ff:7e80:4f1d with SMTP id
 i26-20020a196d1a000000b004ff7e804f1dmr19999217lfc.57.1697159987855; Thu, 12
 Oct 2023 18:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231006172735.420566-1-eajames@linux.ibm.com>
 <CACPK8XcwULKU16zr5CKtufMV2xqeqhWk+1Pv0VMDmMA6oXUgdQ@mail.gmail.com> <3731ff1c-0b23-8ada-836a-4d45f3bcbfc8@linux.ibm.com>
In-Reply-To: <3731ff1c-0b23-8ada-836a-4d45f3bcbfc8@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 13 Oct 2023 11:49:36 +1030
Message-ID: <CACPK8Xc3s6ZndX-AwuG0d7o+px98aQ3G5kbXV68fa4KG2GVHLw@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5 0/4] ARM: dts: aspeed: p10bmc: Add fan
 controller properties
To: Eddie James <eajames@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 12 Oct 2023 at 00:13, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 10/10/23 20:46, Joel Stanley wrote:
> > On Sat, 7 Oct 2023 at 03:58, Eddie James <eajames@linux.ibm.com> wrote:
> >> Now that the max31785 driver can parse the relevant properties, update
> > I can't see a patch that adds that support. Can you point it out?
>
>
> Sure,
> https://github.com/openbmc/linux/commit/ebd863b5c2a2f5bc3ee26fadf39a213a2cdc6efb

Right, that's the openbmc downstream patch. We would like to see that
patch go upstream. Are you able to work on that?
