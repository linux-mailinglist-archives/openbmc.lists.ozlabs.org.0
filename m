Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E896AD36CA
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 03:17:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q9752g0WzDqCZ
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 12:17:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="P1TDOu+h"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q96J33G3zDqTD
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 12:17:12 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id m61so11566530qte.7
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 18:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=FRAhjU6zbOujsKrU9OXTc20iXWxJB1PbXELLM5EnWz4=;
 b=P1TDOu+hLEOcYZdp+RsC60/WrDZp/0xsV3XEPvMb+X1f2sb8KVh050ChS/DzqZuxu8
 LfIixQWkK/AwqxVuEVLOrPZjVGRc6zmnjWRM9aUwlWSTj5xkRz8xU7p99/Qvaynfepcf
 uvsihaoCaRpQWHf2MCAo0RG7xtTRnRD4nq3OsDCv6m3Xy6UY6F/0Q2e3xamg9fFlx88B
 dTEcIY4+AwFNN/rzgizAzI9XEoUwBaH7h3NhapVmfuzZWvdafnrP4nD9jdNIC6FczlsH
 zed2XaA9tN0P9Q3eDjBeau2NNwysV8CtKdbCM2i44OAO7zFoclfCovDLWkJ6fTixQURX
 5EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=FRAhjU6zbOujsKrU9OXTc20iXWxJB1PbXELLM5EnWz4=;
 b=H8dSKxpQ3+SgMDJfMr2/CjBDIVsrzlJAzKEfhrXfZkkYsWSoBueZpJoVsDvaGwnyJH
 zlYSoQpR1qHDpHTGbIRQJZE/4Fof+Wk3g4Ogy+ZyFX1PjHuoQxVp4OcaHhrbscq6wksh
 GopGTTA3XkjTlE/5sTdR6RBiAC3nZsDTAWxOABptIvbTc1noEE5YK5bgpKc9Yxxt0coh
 pOnsCxNrCr8kg0sKj7rj4vNxTT59SpUg6tUgo0nlW2V331nywUWeIQqhIlAadUDvUOjo
 Orn7+7osPv/9Q3lLlsjCBFUbWM3Zs4qBHEaaZjRqh9biX0gQvb9soqOYdFOt725BSYjM
 Qoyg==
X-Gm-Message-State: APjAAAU9hUELi9sVi9Or8gMMsV3/qjjJoy+pQ8S10lY+rCWakjOyBxGm
 c7qmssMztUsWZ81Nke/6H6wDTw==
X-Google-Smtp-Source: APXvYqzOjSHMUU98eUi/w1xmBfaHzCT2guSL+N5oE5fPyX4+S+M5Qlk63IT5XbmdeS8oaoRfnXpgbA==
X-Received: by 2002:ac8:7557:: with SMTP id b23mr14086447qtr.384.1570756628331; 
 Thu, 10 Oct 2019 18:17:08 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id a190sm3908987qkf.118.2019.10.10.18.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:17:08 -0700 (PDT)
Date: Thu, 10 Oct 2019 18:16:51 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v2] ftgmac100: Disable HW checksum generation on AST2500
Message-ID: <20191010181651.5abd4c21@cakuba.netronome.com>
In-Reply-To: <4B7340B5-C35C-4B18-8D8C-B5B8D16BA551@fb.com>
References: <20190911194453.2595021-1-vijaykhemka@fb.com>
 <4B7340B5-C35C-4B18-8D8C-B5B8D16BA551@fb.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Mauro
 Carvalho Chehab <mchehab+samsung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 10 Oct 2019 19:20:47 +0000, Vijay Khemka wrote:
> Resending this patch again.=20

Perhaps I'm missing context but what's the intention here?

In case this is resubmitting the patch for inclusion in the upstream
kernel you need to send it out properly with git send-email or such..

> =EF=BB=BFOn 9/11/19, 1:05 PM, "Vijay Khemka" <vijaykhemka@fb.com> wrote:
>=20
>     HW checksum generation is not working for AST2500, specially with IPV6
>     over NCSI. All TCP packets with IPv6 get dropped. By disabling this
>     it works perfectly fine with IPV6. As it works for IPV4 so enabled
>     hw checksum back for IPV4.
>    =20
>     Verified with IPV6 enabled and can do ssh.
>    =20
>     Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
