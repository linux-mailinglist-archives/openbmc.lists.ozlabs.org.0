Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86B3717C1
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 17:21:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYms03mFbz30G8
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 01:21:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.52; helo=mail-ot1-f52.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYmrh4N9zz2y0J;
 Tue,  4 May 2021 01:20:51 +1000 (AEST)
Received: by mail-ot1-f52.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so1387731otp.11; 
 Mon, 03 May 2021 08:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=GdRfS0NHErZVUqqjMY2tvcA6NmXLytui8eUHJOfx6FM=;
 b=VXTt0uOG92YBXcoDvdDA7ibvjqKRTNUsndzZCalyoqzINbTykzCcLP4q0Us2GfoYpS
 lcz7jmrQ//ZhDc5SCoWQ1w3C92dKw74WFHkX9b6a7cXoEFdCrg2FoUCtMvJr9yzoVCUG
 uHqxT4QVG4L94vRNgkmwcWSnCoHQZZQLae4Lsck0Cyd9TnbpbQ3RStzCAIu1H45tazIz
 8Z4nPvRMgMHcfipgUY7hYzBRCGNR3pAA8RN4As14OGNX4EweWT5odNVuKv3ZfwihCs2c
 EFcspBKzIFgsGLv9ZX2tijsNMIhG+CUE6dR9G+hzFw0VYOfBnBDhMPbvNQCPIvCIyj6B
 BzbQ==
X-Gm-Message-State: AOAM531EaLkhp+N109HaIkmG74OZ9TmbvI7l32bWt9pth0OMNZCj+8AO
 st6tcDOkHUyRaNDNe3raSA==
X-Google-Smtp-Source: ABdhPJw/6Y4/5RNWt0aDLiFM9Q40lQB7DmrNe23N623XZAxpH+zo50yvHPFA1QJ/fbU0MbLiUUK6Qg==
X-Received: by 2002:a05:6830:205a:: with SMTP id
 f26mr15125496otp.118.1620055247487; 
 Mon, 03 May 2021 08:20:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a19sm24101otk.31.2021.05.03.08.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:20:46 -0700 (PDT)
Received: (nullmailer pid 1846828 invoked by uid 1000);
 Mon, 03 May 2021 15:20:45 -0000
From: Rob Herring <robh@kernel.org>
To: Steven Lee <steven_lee@aspeedtech.com>
In-Reply-To: <20210503014336.20256-2-steven_lee@aspeedtech.com>
References: <20210503014336.20256-1-steven_lee@aspeedtech.com>
 <20210503014336.20256-2-steven_lee@aspeedtech.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: sdhci-of-aspeed: Add description
 for AST2600 EVB.
Date: Mon, 03 May 2021 10:20:45 -0500
Message-Id: <1620055245.319540.1846827.nullmailer@robh.at.kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 ryan_chen@aspeedtech.com,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Hongweiz@ami.com,
 Rob Herring <robh+dt@kernel.org>, chin-ting_kuo@aspeedtech.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 03 May 2021 09:43:34 +0800, Steven Lee wrote:
> Add the description for describing the AST 2600 EVB reference design of
> GPIO regulators and provide the example in the document.
> 
> AST2600-A2 EVB has the reference design for enabling SD bus
> power and toggling SD bus signal voltage by GPIO pins.
> 
> In the reference design, GPIOV0 of AST2600-A2 EVB is connected to
> power load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is
> connected to a 1.8v and a 3.3v power load switch that providing
> signal voltage to
> SD1 bus.
> 
> If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> disabled.
> If GPIOV1 is active high, 3.3v power load switch is enabled, SD1
> signal voltage is 3.3v. Otherwise, 1.8v power load switch will be
> enabled, SD1 signal voltage becomes 1.8v.
> 
> AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
> GPIOV3 as power-switch-gpio.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml:97:5: [error] syntax error: expected <block end>, but found '<scalar>' (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/mmc/aspeed,sdhci.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 421, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 109, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.parser.ParserError: while parsing a block mapping
  in "<unicode string>", line 5, column 1
did not find expected key
  in "<unicode string>", line 97, column 5
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/mmc/aspeed,sdhci.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml:  while parsing a block mapping
  in "<unicode string>", line 5, column 1
did not find expected key
  in "<unicode string>", line 97, column 5
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1472993

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

