Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F811DE1C
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 07:07:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z0Z46mbbzDrFY
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 17:07:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.132;
 helo=mail-40132.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="YIW2oS8i"; 
 dkim-atps=neutral
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z0YK64mhzDr9w
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 17:06:42 +1100 (AEDT)
Date: Fri, 13 Dec 2019 06:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1576217197;
 bh=zZ2FuLGOyrVVhyGN/tKdMRzRTHi9M942/UXrQi0pnhA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=YIW2oS8iRAVlX9rYfWbqewsaip4l7hq3x1l1fVL17CJf5AOx6EhHQsvvHFSX8dUyz
 MLXj0t+LcuMAPiC/f37D4Evndazc9qRgDJW+/GkOMfEoy1cpUpM6UKCTrGYjHXd1Rd
 mNvSS75DeeOuXLm5ahVp1mxcLTZ0YTmhXRpJYfO0=
To: James Feist <james.feist@linux.intel.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Faking Sensor Readings
Message-ID: <QXQrQqpVwEnE9XtHvfYLfXFJnlxGAiI2xl1EKmm7Ze2OvCYJxS0d7f4i-1LYhTmPkyMER4ADLxBR6m5bbHriQxR8-dwO35uaB1CTnD8z5qQ=@protonmail.com>
In-Reply-To: <8cef3ef8-a275-2f36-dfeb-7b4da97c6f88@linux.intel.com>
References: <QVdDJHlLW9JS_3uowBPTzSCb1dwpqJjml0ORFR_aQGpuKCve1l8Qwy4GF4X0_dgJmExy8sjJQD_VjnI-o4xwoYhivHJlSPBt42fc1cuDKjw=@protonmail.com>
 <x5Z3U1jaa8Tf-HK1htUFoCqgAFdtIXGaDyEU7SKkgNkehJEtqaps9BvN2j_D5lsgjEgoTL81fZ8nJLitwFaqW2zRkFK8vXhbCrld3Ziy43o=@protonmail.com>
 <2de3b2e2-9b02-a1c2-d310-f6e546e72c1e@linux.intel.com>
 <JIIzLFDdd2_yAem6ToyksGqeJ7ulaTOylaocMLH19rYqyv3fSzcEL2H9VDJW66iYQY8L8FwjgpZqPFj8rRD0JP52xsAHQ6kD4_ygDAjj0LE=@protonmail.com>
 <e59e36d1-74fc-5f44-a472-26fdfb127af2@linux.intel.com>
 <iSeeVedIu2fcqVt4W4TlDAQNHMjfTxE0NUAs68nlqossQmqy5OdbHgn9YHO1kh88ZpFMHO6bpGL7ki2hS9mQgw2d7Dk2WQFH-o6jOH6e1g4=@protonmail.com>
 <8eb66be0-c5a4-ac3d-2421-8648c2fc4a4f@linux.intel.com>
 <EPYcrss0WRTceNCXy6GM0cmf5GE-4TzTQLyLuYd581ufdbKteABRuQArHVWcPPAHaCBK8_0nIRJ2DP5hSh5jS2AgDPjr_snA5bh91FU-OOI=@protonmail.com>
 <8cef3ef8-a275-2f36-dfeb-7b4da97c6f88@linux.intel.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
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
Reply-To: rgrs <rgrs@protonmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Understood now. Thanks for the detailed reply.

~raj


=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Thursday, December 12, 2019 9:27 PM, James Feist <james.feist@linux.inte=
l.com> wrote:

> On 12/11/19 9:28 PM, rgrs wrote:
>
> > Hi James,
> > Thanks for the help.
> > One more clarification please,
> > How is entity-manager different from phoshor-hwmon conf files?
>
> Entity-manager does runtime detection based on available d-bus
> properties. In most cases it's based on Fru Detection, but anything on
> d-bus can be used to configure. So you can write Probe statements (at
> the bottom of the configuration files in most cases) that say when this
> key/value pair exists on d-bus, install this configuration. This is most
> useful for add-in-cards or other removable devices, so that when it
> exists, the configuration gets loaded. For example this retimer card
> https://github.com/openbmc/entity-manager/blob/master/configurations/PCIE=
 SSD Retimer.json
> says when a Fru Exists with BOARD_PRODUCT_NAME set to a specific value,
> then load these sensors. It can then export sensors to sysfs as well if
> needed. Entity-manager is also not limited to sensors, it also
> configures things like phosphor-pid-control
> https://github.com/openbmc/entity-manager/blob/7d807754cc9153b04b59980446=
4edd9654d7a81e/configurations/WFT Baseboard.json#L1678.
> We use it specifically so we can use 1 binary for multiple baseboards
> assuming similar i2c topology. At a high-level view, it takes JSON and
> when appropriate fields are available on d-bus, puts a system
> configuration on d-bus, along with being able to export some i2c devices.
>
> Hope this helps
>
> -James


