Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C38B40D9D6
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 14:22:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9GS041Lqz2yLN
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 22:22:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.44; helo=mail-io1-f44.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9GRj1cRzz2xXR;
 Thu, 16 Sep 2021 22:22:08 +1000 (AEST)
Received: by mail-io1-f44.google.com with SMTP id b200so7610077iof.13;
 Thu, 16 Sep 2021 05:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=eBjsALulZMPTSCf3SKKox/6zb556B2h+vF/yLzDTuL0=;
 b=rEHsjaZKvEdZ0JJeot3kiTZsMOXFBvZcN1XscnsrtJK0fLHu52brBSkdVJV+vdEDBN
 MRzCipTogI0oSva5LNdBhVFrpbIkNbhpOfrzK2lr8d6HepIYpczf+34D9WIlfpjKSG8w
 qMM/APeU5hWPWZlyDQlfAm3hhGDsz8Yzuz0pLRSg0+6PKlsNcF+sfw7QNZWLWpsfC9Tu
 7uGKPVGucvt3DiA/0pG3p95Uw8XREZNeu9YevamejGhh4OQf2GjNaVQSvtkJz9JwkWzK
 J9pytZiZEw70qTIoFhtQDYvoG+U1dtTRx8/4AowjF61FB4N87GB50Lgqe98fvXLD1/Kf
 w/Rg==
X-Gm-Message-State: AOAM530LT8uoosBynuqRv2zQewq9rGxEL8i/qRoIvuYj8J9sjzJLxDr9
 QYoMTRtdw9hhlfb8zYSMJw==
X-Google-Smtp-Source: ABdhPJybW8Pfcs+9FTVdwooVbW86PI0JLe53MZTM9I99F070ENPtsjWaVlV5cuzQy4jxtSJmwL8xCA==
X-Received: by 2002:a05:6602:38e:: with SMTP id
 f14mr4215684iov.62.1631794925414; 
 Thu, 16 Sep 2021 05:22:05 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net.
 [96.84.70.89])
 by smtp.gmail.com with ESMTPSA id d12sm1564858iow.16.2021.09.16.05.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 05:22:03 -0700 (PDT)
Received: (nullmailer pid 1119424 invoked by uid 1000);
 Thu, 16 Sep 2021 12:21:53 -0000
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
In-Reply-To: <20210916092515.10553-2-chiawei_wang@aspeedtech.com>
References: <20210916092515.10553-1-chiawei_wang@aspeedtech.com>
 <20210916092515.10553-2-chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
Date: Thu, 16 Sep 2021 07:21:53 -0500
Message-Id: <1631794913.526068.1119423.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, yulei.sh@bytedance.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, osk@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 16 Sep 2021 17:25:12 +0800, Chia-Wei Wang wrote:
> Convert the bindings of Aspeed LPC from text file into YAML schema.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 157 ---------------
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   | 187 ++++++++++++++++++
>  2 files changed, 187 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/aspeed-lpc.example.dt.yaml:0:0: /example-0/lpc@1e789000/lpc-snoop@90: failed to match any schema with compatible: ['aspeed,ast2600-lpc-snoop']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1528736

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

