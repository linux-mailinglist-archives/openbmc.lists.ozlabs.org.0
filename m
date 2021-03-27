Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0353834B826
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 17:36:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F74H14zcFz302x
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 03:36:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.41; helo=mail-oo1-f41.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F74Gq6Zz8z2xYc
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 03:36:17 +1100 (AEDT)
Received: by mail-oo1-f41.google.com with SMTP id
 c12-20020a4ae24c0000b02901bad05f40e4so2028036oot.4
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 09:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ezf8ZsxHR7Q2VJAPplq3OYrE78elzd24DdXuyG3/QdU=;
 b=mRSrf4OmOfbwr7t0hTqmnTpPsX6YYCIVHH7AGuA1aXPJOb4riMf+DnyAZhY9VeE6cf
 tIGeKNAr1TMdT5huZdU535w0Ai9sPGkDfYEBPzKyq8FPLzfwWmx2QvphGsAZEKbrpUGO
 ltfP/L3qzwEPNrWVXjFLA6R0GEpIf48EzkEZIKTztJMTVpf7Q3ToOjEg/keI77r9I/e6
 Q8Ucn8TxyXOXAmdxi/woOfMhomRFRdVn483uqmwAaevsK8ncerzBqaRYxUJkL+MzRBWr
 gGENyrp/xLGiI5hhsesGaJPau/+j5bSsFdgPOfH7djfkDYbVSUGuLu1L6QTC6acUGdSm
 h+fw==
X-Gm-Message-State: AOAM53156TJAws7Wb/f/adqRKD8N5CF/lewY+a05gYfaZgcbv8k/296b
 mLMllWf5+75xF06kvth4FQ==
X-Google-Smtp-Source: ABdhPJwM2NDuERRYq4E1lpdIQVS9lu3Mp0RN1p4NlSoqMq2IIvvWtukgPmGwLYlQ3CquH1KP9J1iNQ==
X-Received: by 2002:a4a:aa82:: with SMTP id d2mr15919534oon.52.1616862973377; 
 Sat, 27 Mar 2021 09:36:13 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
 by smtp.gmail.com with ESMTPSA id l26sm2922978otd.21.2021.03.27.09.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 09:36:12 -0700 (PDT)
Received: (nullmailer pid 210814 invoked by uid 1000);
 Sat, 27 Mar 2021 16:36:08 -0000
Date: Sat, 27 Mar 2021 10:36:08 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 01/14] dt-bindings: vendor-prefixes: Add Supermicro
Message-ID: <20210327163608.GA203544@robh.at.kernel.org>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210320181610.680870-2-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, allen <allen.chen@ite.com.tw>,
 openbmc@lists.ozlabs.org, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Oleksij Rempel <linux@rempel-privat.de>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Max Merchel <Max.Merchel@tq-group.com>,
 Shawn Guo <shawnguo@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 20 Mar 2021 19:15:57 +0100, Jonathan Neuschäfer wrote:
> Super Micro Computer, Inc. (https://www.supermicro.com/en/), commonly
> known as Supermicro, is a manufacturer of server hardware.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
