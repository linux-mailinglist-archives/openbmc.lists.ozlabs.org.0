Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15A97C2B0
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 03:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8JJD0FGrz3bZ6
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 11:45:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726710344;
	cv=none; b=DmC3gGz8J1fQENEsJOxo4PMmh5J496Y9s53VqYzoF3aaQMdO8+SpTqKV96ftKn4aeElHlJ1A8WvtOd3jF/UnoOmivmOQ2rCQzScLcEVoQieI286F0VENiYJcAnTeZzzgA1xYgMWemRAG/98jHBzi6ZNJJY/Mdts7dzcEtwOSYoeyXVwTg7k5Yznx3/8WM+JDkiZ6FK3wjalieSpGb1Z8top7aBP9JquDmrQtzePCNbn7DnrzkTFflEl7B+6+DKPj73YdzQ8Tf8GKVRgl9JN3pUUoWGDV5p4SfdMo8lFPV+4rNyy/3qYjThnBBXeqQHDapXrLa2B3AFQ6DFg+CFmcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726710344; c=relaxed/relaxed;
	bh=VgnCtdAk6lb3Sr23RFqM8ound6zyQIntpDJ821pp0Ik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cMxqEYDBPG4LoJgn5NSwg5umveTJ/4Khmj4CFnwnQJu9Cl5dRttx7SrrQpdr70hrHsvRIoKT8P21mofX9lxq4YzQgCAQ7x5OhXr0/HL7YatxH3mlxCdnZ5RJ/DndOAn2wsl5p52nt0qpnHUDleCMMTCgh5jCAW/rooXJ/tqD1zbiDGTlx0xl6x4TA2p4snEbAKaENqGermJ7jUyBZsh5SiD9LtQ+izcZ8DYZek5hbUiWNyccWoJcCnm0muLODFFCFYeM7NAB6cgtvxusI5tbtO/l2Hqcnnixm4dGSmBGi9vzBat0DXOoBvdUwReGpE/8GLPBbTOGOUPLzfW7bJeAEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fIso8GI5; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fIso8GI5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8JJ81bHNz2xfP;
	Thu, 19 Sep 2024 11:45:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726710343;
	bh=VgnCtdAk6lb3Sr23RFqM8ound6zyQIntpDJ821pp0Ik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fIso8GI5Kxzw5p6Ywze2nDiMEA6sKcqWcXj0K9RKKJBV17F+Jlem1Lk59iQB3qqWE
	 UmDXMmzZAub8vSxdAfk5jqhSJUcKss9EmdlsYfXXbt89ec8aKNSN4PvgUSLDDK0kg2
	 rgnulKyemqvH1/gezXbK1fabzsQQHQK1cWbYgMp/LHP/ijtifMERticdf9Ao4stnFh
	 MpBIYcRJq7SW4YA+6EAs5aOhfpSX6wO3ovsiYCu1ijVPmYGvg42iwRhIxpjWzqdcQb
	 aagV3GQjHae/OAg21C3nw7KyGpC+e59VKYAXJj4Gmvd3EpQ856cdME186jrEf65YMv
	 qdVaHADV4CcgQ==
Received: from [127.0.1.1] (ppp118-210-188-185.adl-adc-lon-bras34.tpg.internode.on.net [118.210.188.185])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 90F2465027;
	Thu, 19 Sep 2024 09:45:42 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Manojkiran Eda <manojkiran.eda@gmail.com>
In-Reply-To: <20240918-dts-aspeed-system1-peci-snoop-v2-1-2d4d17403670@gmail.com>
References: <20240918-dts-aspeed-system1-peci-snoop-v2-1-2d4d17403670@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable PECI and LPC snoop for IBM
 System1
Message-Id: <172671034240.638277.4020741280785958625.b4-ty@codeconstruct.com.au>
Date: Thu, 19 Sep 2024 11:15:42 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org, Ninad Palsule <ninad@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 18 Sep 2024 14:50:03 +0530, Manojkiran Eda wrote:
> This patch enables the PECI interface and configures the LPC Snoop for
> ports 0x80 and 0x81 in the ASPEED BMC for IBM System1.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

[1/1] ARM: dts: aspeed: Enable PECI and LPC snoop for IBM System1
      commit: abfafb7269c3c1d73a2a7136f9d3f7e417c83a4c

--
Andrew Jeffery <andrew@codeconstruct.com.au>

