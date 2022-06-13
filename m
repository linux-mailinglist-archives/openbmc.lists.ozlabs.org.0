Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089815485F5
	for <lists+openbmc@lfdr.de>; Mon, 13 Jun 2022 17:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMFpp5t0rz3blf
	for <lists+openbmc@lfdr.de>; Tue, 14 Jun 2022 01:29:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W+9bwBPV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W+9bwBPV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMFpM2bnhz3blC
	for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2022 01:28:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C46B5614E6
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 15:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335FCC3411B
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 15:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655134119;
	bh=Dya8+t1QAtJ3oxTE/w7JBXY3Zy4dSxKdD4rHdX/ukpU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W+9bwBPVa6gi1WBdJnbOZQ9otuTgRa+uQlfgJjus5ISO4CQoKszfbzn/2ujRSDS9w
	 YU5R9bYYkgqU5tFuUOWjLWOVA5BmosI9eYXKhxos+SrBcSuHyxQ0CFNGAcSW5YkEKZ
	 CKnrAWrLDnLKjoEPb6e+1TWmduzAzsSgmyUHhBjr9+hps+tSaZQXWk8EVyZ06PCU2z
	 kdb1Ht0264pqgRRMsIQi/OGqeG+CdxpiKjLHUrwNXX0HGDqzsyf588udukbhcTCNwX
	 QlQJPHq3iyBQMnESw/1crRKvxxikenY0sgNBGrHHXH003Fsbx+4bV88jEQ5qcTpUHK
	 Sp1Xoinc1NUUA==
Received: by mail-vs1-f47.google.com with SMTP id e20so6232501vso.4
        for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 08:28:39 -0700 (PDT)
X-Gm-Message-State: AJIora9XHNRvTPgTPNfMgFnxwXRzwvwcieSPhm1pmxuKTp4TDwXIaG5U
	NKjURKrggHRxomOJLTqXyM229ngg7nneZLt4cg==
X-Google-Smtp-Source: AGRyM1umgaHpMsDuaM9Lw94TfUrdKW7JXHhr0M5N07BAWPFzL5Dd/52HH45wQ0ShL4JTzWTYPX1477u063LUFx5tJoE=
X-Received: by 2002:a67:d38c:0:b0:349:d028:c8ea with SMTP id
 b12-20020a67d38c000000b00349d028c8eamr133392vsj.6.1655134118163; Mon, 13 Jun
 2022 08:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
 <20220610165940.2326777-6-jiaqing.zhao@linux.intel.com> <1654903146.313095.2450355.nullmailer@robh.at.kernel.org>
 <21c9ba6b-e84e-4545-44d2-5ffe5fea9581@linux.intel.com>
In-Reply-To: <21c9ba6b-e84e-4545-44d2-5ffe5fea9581@linux.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 13 Jun 2022 09:28:26 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+y3tkfLV8UpUe6jw7Fq7YDrzwoq3FKK4jeeZEBOxhM4g@mail.gmail.com>
Message-ID: <CAL_Jsq+y3tkfLV8UpUe6jw7Fq7YDrzwoq3FKK4jeeZEBOxhM4g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: net: Add NCSI bindings
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 10, 2022 at 9:09 PM Jiaqing Zhao
<jiaqing.zhao@linux.intel.com> wrote:
>
> On 2022-06-11 07:19, Rob Herring wrote:
> > On Sat, 11 Jun 2022 00:59:39 +0800, Jiaqing Zhao wrote:
> >> Add devicetree bindings for NCSI VLAN modes. This allows VLAN mode to
> >> be configured in devicetree.
> >>
> >> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> >> ---
> >>  .../devicetree/bindings/net/ncsi.yaml         | 34 ++++++++++++++++++=
+
> >>  MAINTAINERS                                   |  2 ++
> >>  include/dt-bindings/net/ncsi.h                | 15 ++++++++
> >>  3 files changed, 51 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/net/ncsi.yaml
> >>  create mode 100644 include/dt-bindings/net/ncsi.h
> >>
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_chec=
k'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ne=
t/ncsi.yaml: 'oneOf' conditional failed, one must be fixed:
> >       'unevaluatedProperties' is a required property
> >       'additionalProperties' is a required property
> >       hint: Either unevaluatedProperties or additionalProperties must b=
e present
> >       from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ne=
t/ncsi.yaml: ignoring, error in schema:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ne=
t/ncsi.example.dtb: ethernet@1e660000: 'ncsi,vlan-mode' does not match any =
of the regexes
> >       From schema: /builds/robherring/linux-dt-review/Documentation/dev=
icetree/bindings/vendor-prefixes.yaml
>
> I saw vendor-prefix.yaml says do not add non-vendor prefixes to the list.=
 Since "ncsi" is not a vendor, may I ask what is the suggested replacement =
for 'ncsi,vlan-mode'? Will 'ncsi-vlan-mode' be fine?

I don't know. What is NCSI? Is it specific to certain MACs? Why do you
need to set this up in DT? Network configuration is typically done in
userspace, so putting VLAN config in DT doesn't seem right. All
questions your commit message should answer.

>
> > Documentation/devicetree/bindings/net/ncsi.example.dtb:0:0: /example-0/=
ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast=
2600-mac', 'faraday,ftgmac100']
> > Documentation/devicetree/bindings/net/ncsi.example.dtb:0:0: /example-0/=
ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast=
2600-mac', 'faraday,ftgmac100']
>
> The ftgmac100 it depends on uses a txt document instead of an yaml schema=
. And I see there is other schemas having the same error, can this be ignor=
ed?

No. Don't add to the list. Once all the existing warnings (~40) are
fixed, then this will be turned on by default.

>
> And I've got one more question. The ncsi driver does not has its own comp=
atible field, instead, it is enabled by setting the "use-ncsi" property of =
some specific mac drivers. Though currently only ftgmac100 supports ncsi in=
 upstream kernel, it may be used by other mac drivers in the future. What d=
o you think is a proper way for defining the ncsi schema? Having it in a se=
parate yaml like this patch or add the properties to all the mac yamls that=
 supports yaml? If the former way is preferred, how should the schema be de=
fined without "compatible"?

If it is a function of driver support or not, then it doesn't belong in DT.

Rob
