Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E088067B8
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 07:47:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=X25ximIE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlSdk4WbSz3d89
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 17:47:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=X25ximIE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlSd64n8Sz3cTm
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 17:47:22 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a1d6f4a0958so88899766b.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 22:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1701845239; x=1702450039; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17cTUDt8kn3ejIxoPm4nVYZ7FdYTC8BE0PfokmKU9is=;
        b=X25ximIEfP4X2rco7A+wLCsN6bGL0N9RVZYzg1TUMy3Sgra4w1o4Ucol8tnhC8kFch
         gF30k1jge2fwtzlAfzI1rrfN347KesTsa2bHyzLTQSVmzugo4xx3nbv6mZEb44fwZKlN
         rF/JlWm5ABzDOAxQDUzCI9b3vA5QB7eSFLVWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701845239; x=1702450039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17cTUDt8kn3ejIxoPm4nVYZ7FdYTC8BE0PfokmKU9is=;
        b=C0T3ABfbbyzKqD96QaWVBnRhG7OaWwhng0HgTV85YmTQfCUze8a/986i5gqloleGT4
         QwvDYN4qC4QEjv3kR3u4PF32k3OZETCqB4XhBhInT6afM9tuNu2myO6rPNc/CukT0dl0
         WWWKy7xnoZNIB0sCkPWVwmI6zEZMTOKvj4B5JG2yKw60PAIUDWWat3L1gydr3fnUeE6n
         +df69qUVUV5UMpY2/nxJllMoS1ZVdmIbN5+XjWzblI3pnEV32TO8DFcuHtZllsu0/l+o
         qJIkS5X/SqqcBXgu6nwF8PEDgZ3UySIuIBYeRxZIY+Lk+yLU8+ECEvc/+LDdysdagmd3
         Mdaw==
X-Gm-Message-State: AOJu0Ywe331QDtJZYAHnBNuPWRd1R44W3cWpKkah+/PO6Sb4kuK4aLfW
	5GA4WSAALZpPSkawMuH+zuhQH0AXnRgnvqI9wZMuLwcc
X-Google-Smtp-Source: AGHT+IFIzB4r4cMY6t1DHysNGgxoXt1lFGcl3QXrDbw453J2hbk8jITmlnL3g69KfknnnGAYauSjDXHFXiLof8sEU+A=
X-Received: by 2002:a17:906:3f17:b0:9fb:ddb4:1285 with SMTP id
 c23-20020a1709063f1700b009fbddb41285mr2652520ejj.31.1701845239527; Tue, 05
 Dec 2023 22:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20231206023742.5242-6-zev@bewilderbeest.net>
In-Reply-To: <20231206023742.5242-6-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Dec 2023 17:17:08 +1030
Message-ID: <CACPK8XeXqgonvj5WQfx+ov8o5OrABLHXDqs3ST27ij59yC67yA@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5 0/4] Add device trees for ASrock E3C256D4I & SPC621D8HM3
To: Zev Weiss <zev@bewilderbeest.net>
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

On Wed, 6 Dec 2023 at 13:07, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello,
>
> These patches add support for the BMCs on the ASRock e3c256d4i and
> spc621d8hm3 boards.  All four patches are currently in the 'for-next'
> branch of Joel's bmc.git tree.  I used the '-x' flag when
> cherry-picking them onto the dev-6.5 branch, but since they're not yet
> actually merged into the mainline kernel I suppose it's possible the
> upstream commit hashes might still change, so feel free to drop those
> tags as preferred.
>
> [Mistakenly didn't CC the list on first send, apologies for the
> duplication Joel & Andrew.]

I've merged these on top of the shiny new 6.6 tree.

Cheers,

Joel
