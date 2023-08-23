Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A969784EFA
	for <lists+openbmc@lfdr.de>; Wed, 23 Aug 2023 04:59:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rN0V7plx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVrY715xmz3bwX
	for <lists+openbmc@lfdr.de>; Wed, 23 Aug 2023 12:59:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rN0V7plx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVrWm65G6z3c0X
	for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2023 12:58:43 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bf1f632b8so687975366b.1
        for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2023 19:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692759514; x=1693364314;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ziIiWu4xfL1aImCrCB4FL+t7UCeyqv6AR9wYjuija0=;
        b=rN0V7plxOtYz6szyOtP6RvFLWakPbjiR5vJr78nftFQSIRGXYFfkpZRoZ4HDG+f8qN
         +5S5FrzefYP8wDfh7CqgMRX73FHKz4dSlQgOP0d55ZPpVgi53xdUtOHYGgYGQ/TZejZk
         T35yXqeiYzDp/kaNmWQzjbfrLKurcBnLRRt874wrhf8lA3ThG/QYnYJzQoEiacLSK9hT
         qg/9V7Ou7M6LphupdgMv5Qxmw+KXRWLzw1cHVVyltRElEmkalh9AJqUVfpkW4J0169ud
         v3v3S0i2BGN+2gGxHxKvHYfA2ZmyLnS5T1e2a3xj3S0VSxKhUaeBv3C/a7SCFnbqAf6+
         GU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692759514; x=1693364314;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ziIiWu4xfL1aImCrCB4FL+t7UCeyqv6AR9wYjuija0=;
        b=MCrvUH/wN3p06eD5xjlpxi6yZyi3nT0ufjnXkhIwD6BSg/Kku4/SEQgtFA13upOGvG
         rYg+D9Vp9CBCZ3A0Jmf9okTbw/N/brFNYsm/xJxC0Um9lrJQcxmgSYrPhHt0F20D7Lmk
         KTGYutYKxqoe+sJ0wZj4PbePvE05pLm+eaSuZ77oRYyaMG0a/bNbtKdHb2Doeuu3ui+o
         a375gijdZvEDwW5z8aO/05xuuKjCJDUA6AF6WieJgacxOrn9G+w+nhmo+3RSgdGzgw+5
         od88J3LFaoiFVATii5HmRR9JN5Pc9JDGGPNMWNbudINfw+I4VK3JaEBwfa9cLS2S2k1n
         SL8g==
X-Gm-Message-State: AOJu0YwUTVImc4IDGd+KrMuRxV808qMe9zujPq6TQlcoYmd71Wbhj2rn
	vXb03M7DN7uu8InpyDNQBCQG3h2gFyXLswCg1vcmV6BWmQ0=
X-Google-Smtp-Source: AGHT+IGOb8TpFfKAga/D7W3dmCXURoU4aGp4bpMJ3NjZGheVb8M3HHvEi/AAZ3fgnI+3z03xAFmvJaZyTHX98NxZHpk=
X-Received: by 2002:a17:907:2718:b0:99c:55ac:3a61 with SMTP id
 w24-20020a170907271800b0099c55ac3a61mr7900480ejk.56.1692759514233; Tue, 22
 Aug 2023 19:58:34 -0700 (PDT)
MIME-Version: 1.0
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Date: Wed, 23 Aug 2023 08:28:22 +0530
Message-ID: <CA+BG2nabXk1g9V3fM5XryTyDigzkxr41WtmYHuFHsrNbnrN=gQ@mail.gmail.com>
Subject: MCTP Over USB
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000893d6806038e49d1"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000893d6806038e49d1
Content-Type: text/plain; charset="UTF-8"

Greetings,

We (at NVIDIA) have been looking at the WIP MCTP over USB specification
[1]. From what I know, the specification will be ratified very soon.
I am reaching out to the community if there is any interest in developing a
MCTP over USB binding for either the in-kernel MCTP bindings [2] or the
(now deprecated?) libmctp [3].

Our interest is to develop the necessary driver support to enable USB MCTP
interface driver for AST2600 and the binding itself.
--
Santosh

[1]
https://www.dmtf.org/sites/default/files/standards/documents/DSP0283_0.1.5WIP10.pdf
[2] https://github.com/openbmc/linux/tree/dev-6.1/drivers/net/mctp
[3] https://github.com/openbmc/libmctp

--000000000000893d6806038e49d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,<br><br>We (at NVIDIA) have been looking at the =
WIP MCTP over USB specification [1]. From what I know, the specification wi=
ll be ratified very soon.<br>I am reaching out to the community if there is=
 any interest in developing a MCTP over USB binding for either the in-kerne=
l MCTP bindings [2] or the<br>(now deprecated?) libmctp [3].<br><br>Our int=
erest is to develop the necessary driver support to enable USB MCTP interfa=
ce driver for AST2600 and the binding itself.<br>--<br>Santosh<br><br>[1] <=
a href=3D"https://www.dmtf.org/sites/default/files/standards/documents/DSP0=
283_0.1.5WIP10.pdf">https://www.dmtf.org/sites/default/files/standards/docu=
ments/DSP0283_0.1.5WIP10.pdf</a><br>[2] <a href=3D"https://github.com/openb=
mc/linux/tree/dev-6.1/drivers/net/mctp">https://github.com/openbmc/linux/tr=
ee/dev-6.1/drivers/net/mctp</a><br>[3] <a href=3D"https://github.com/openbm=
c/libmctp">https://github.com/openbmc/libmctp</a></div>

--000000000000893d6806038e49d1--
