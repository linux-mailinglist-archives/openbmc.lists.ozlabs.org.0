Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2196F372451
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 03:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ2mk0gdhz2yyb
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 11:48:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ2mR41JSz2yQy;
 Tue,  4 May 2021 11:48:06 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1441YjVt019378;
 Tue, 4 May 2021 09:34:45 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 09:46:26 +0800
Date: Tue, 4 May 2021 09:46:23 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: sdhci-of-aspeed: Add
 description for AST2600 EVB.
Message-ID: <20210504014622.GB20079@aspeedtech.com>
References: <20210503014336.20256-1-steven_lee@aspeedtech.com>
 <20210503014336.20256-2-steven_lee@aspeedtech.com>
 <1620055245.319540.1846827.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1620055245.319540.1846827.nullmailer@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1441YjVt019378
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
 <devicetree@vger.kernel.org>, Ulf
 Hansson <ulf.hansson@linaro.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>, Ryan
 Chen <ryanchen.aspeed@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "Hongweiz@ami.com" <Hongweiz@ami.com>, Rob Herring <robh+dt@kernel.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 05/03/2021 23:20, Rob Herring wrote:
> On Mon, 03 May 2021 09:43:34 +0800, Steven Lee wrote:
> > Add the description for describing the AST 2600 EVB reference design of
> > GPIO regulators and provide the example in the document.
> > 
> > AST2600-A2 EVB has the reference design for enabling SD bus
> > power and toggling SD bus signal voltage by GPIO pins.
> > 
> > In the reference design, GPIOV0 of AST2600-A2 EVB is connected to
> > power load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is
> > connected to a 1.8v and a 3.3v power load switch that providing
> > signal voltage to
> > SD1 bus.
> > 
> > If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> > disabled.
> > If GPIOV1 is active high, 3.3v power load switch is enabled, SD1
> > signal voltage is 3.3v. Otherwise, 1.8v power load switch will be
> > enabled, SD1 signal voltage becomes 1.8v.
> > 
> > AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> > The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
> > GPIOV3 as power-switch-gpio.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 99 +++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml:97:5: [error] syntax error: expected <block end>, but found '<scalar>' (syntax)
> 
> dtschema/dtc warnings/errors:
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/mmc/aspeed,sdhci.example.dts'
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-extract-example", line 45, in <module>
>     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 421, in load
>     return constructor.get_single_data()
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 109, in get_single_data
>     node = self.composer.get_single_node()
>   File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
>   File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
> ruamel.yaml.parser.ParserError: while parsing a block mapping
>   in "<unicode string>", line 5, column 1
> did not find expected key
>   in "<unicode string>", line 97, column 5
> make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/mmc/aspeed,sdhci.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml:  while parsing a block mapping
>   in "<unicode string>", line 5, column 1
> did not find expected key
>   in "<unicode string>", line 97, column 5
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml: ignoring, error parsing file
> warning: no schema found in file: ./Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> make: *** [Makefile:1414: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1472993
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Thanks for the log and the information, I will install the package
and do the check before re-submiting the patch.

