Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD9349F02
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 02:49:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F64dT0T0gz3bqd
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 12:49:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.52; helo=mail-io1-f52.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F64dH61cmz30L1;
 Fri, 26 Mar 2021 12:48:50 +1100 (AEDT)
Received: by mail-io1-f52.google.com with SMTP id z136so3862337iof.10;
 Thu, 25 Mar 2021 18:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X6YTJv8PO1HpNTdDvMgdjs2viXmFhvJEOHLtU1v5wAY=;
 b=CHawjj+kHVvuWLRRH/TI5wFptWl2JlSrNa00m6RAxGNjVCSeRksFe1Ux6u+qZ8ngpl
 8t0YD8LEMiG6Lf/gDp1CIIij4PlrBEmNs0AZla5EP09lX1swLSnADOfRDOOjPRuaZ2bB
 RxvdcbPC251HZ4ip1KkhOUC4HR5FvgqbKwjJDQ1fzI1YVJ4eUSsk04I0K/rvo62kAXfI
 4Ogf3hkd44TgdPijyOLVEFGROwHChiJpg88BdmWLL8g6QefXgHcBwXibTI017m23nYKP
 tdW7ga7AFLws9tlD+c5VaGgPP23mMOWbKbEgK1jdj0EaTgXcrqk60yjgkUvlCmgrh0rV
 GcVg==
X-Gm-Message-State: AOAM530i4bg3TWplmf7XHTAU6V3n+0ql8EH0I9rpoexC+IJrShjrbezc
 ocU6bjPbOFfo2cYJBzedPw==
X-Google-Smtp-Source: ABdhPJyDmoRag/D/LcKrCkrgOgZ/N8vDgz2C2nifLnc+tV7blqHuXcykgqFsEtGx5Ud/vQlEzwZksA==
X-Received: by 2002:a6b:6418:: with SMTP id t24mr8313385iog.159.1616723325341; 
 Thu, 25 Mar 2021 18:48:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k17sm3561002ilr.57.2021.03.25.18.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:48:44 -0700 (PDT)
Received: (nullmailer pid 2158331 invoked by uid 1000);
 Fri, 26 Mar 2021 01:48:42 -0000
Date: Thu, 25 Mar 2021 19:48:42 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 17/21] dt-bindings: ipmi: Convert ASPEED KCS binding
 to schema
Message-ID: <20210326014842.GA2158272@robh.at.kernel.org>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-17-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319062752.145730-17-andrew@aj.id.au>
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
Cc: minyard@acm.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 ryan_chen@aspeedtech.com, tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org,
 avifishman70@gmail.com, venture@google.com, chiawei_wang@aspeedtech.com,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 openipmi-developer@lists.sourceforge.net, lee.jones@linaro.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 16:57:48 +1030, Andrew Jeffery wrote:
> Given the deprecated binding, improve the ability to detect issues in
> the platform devicetrees. Further, a subsequent patch will introduce a
> new interrupts property for specifying SerIRQ behaviour, so convert
> before we do any further additions.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
>  .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
>  2 files changed, 92 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
