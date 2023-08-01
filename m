Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833A76A74B
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 05:05:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Bxz0u3+g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFKjJ1rV3z30fs
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 13:05:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Bxz0u3+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::a29; helo=mail-vk1-xa29.google.com; envelope-from=benjaminfair@google.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFKhg1l0yz2ydQ
	for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2023 13:04:33 +1000 (AEST)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-486556dea4dso2115468e0c.1
        for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2023 20:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690859068; x=1691463868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e4T8ye2F2gZWrq++FbJL8+xO2t0kB53p7R6NvSowrVU=;
        b=Bxz0u3+ggSo+uBqPt7qMC41Yz5v+Mc+ChDPIF4qcKa5WUecZu4y1GIaxkPIXVcpQH4
         BXKo7kJYpWIYwlG1vH7dNVa6av8DZRCjb+AZYrsSJKCdzgjD9ztBxFfAOa4w0H2XOUTA
         bK/Z3KaFR3C847PHWTkNjUx+TU/5R6P0Mcxb/OKC3uct2QGuwbAyJRk6FQudIarxw5Yo
         p/lRLz7kpucZZaCXMBawFHEDHKq7gIUshCFWWe0ryli3qCVyEdghu2rTxPrBbEQSFVRm
         E80iKj/f467bzwyvuh0xskKvI3GMrnNKzpAZUoDnpR87S2x3ghJVmJkce7eOo2W6GECf
         +lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690859068; x=1691463868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4T8ye2F2gZWrq++FbJL8+xO2t0kB53p7R6NvSowrVU=;
        b=IAr1eWgQ7gahcL0MlRBcqMnULXYjT7vXzTBdK1oNRXeotcFvtkWnfQxry2opOvkLEJ
         0U23fURcaVyE91rMULOh/ETrJBN1WgBANpMFBhf79tPzXKoPiPRwWbBLcyiSlLr/kM9A
         2AjhBID/WZ8WFHmW6QxgfJ/UpU/5gWFXqIapYqf0Jkr1QHaOjjpLazrXVxEDz81jQhkX
         HgC4E21/I4SZN3L+xM1dGpykKliNa+LAECwQ4lbkChVCL+dgiNflWFTMXqhB1fWEoNbX
         dz/anVs6s5lenxCnFLMoGeeqGFZDWiVOIuV8+nt9IKe+5Auvda8e6vUdVFS62DdxniMj
         vF5Q==
X-Gm-Message-State: ABy/qLbZeKi6D1O6xikvb0Gu2x3caRARi6tuLxouv74fRAcDz6oBPucD
	TC5VaZ8lXjGf6MpWc9IzsSluiqI2GkxdMSzUIcKEhA==
X-Google-Smtp-Source: APBJJlEdCe+vPx4oP8SFyU0rFBHNgKnXrAddoTWsdGM0m1DiZQf7l9Tvc/MZbKxrfMtwtt9sWwdsAryyQbEO0qbSmXI=
X-Received: by 2002:a1f:cf47:0:b0:481:3423:4f1f with SMTP id
 f68-20020a1fcf47000000b0048134234f1fmr1393914vkg.4.1690859068037; Mon, 31 Jul
 2023 20:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR18MB28447289EC30EEB56B81D1B6AF05A@DM6PR18MB2844.namprd18.prod.outlook.com>
In-Reply-To: <DM6PR18MB28447289EC30EEB56B81D1B6AF05A@DM6PR18MB2844.namprd18.prod.outlook.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 1 Aug 2023 11:03:51 +0800
Message-ID: <CADKL2t5brPmO_va-G9B=yySEvyfHJm4QzStvKaquA4K+gRY3sw@mail.gmail.com>
Subject: Re: MCTP over i3c
To: Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Shesha,

Work on MCTP over I3C is ongoing in upstream Linux:
https://lwn.net/Articles/937196/

Benjamin


On Tue, 1 Aug 2023 at 02:35, Shesha Bhushan Sreenivasamurthy
<sheshas@marvell.com> wrote:
>
> Hi All,
>
>   Is there any effort to support MCTP over I3C in the openBMC, particularly on aspeed HW?
>
>
>
> Thanks,
>
> Shesha.
