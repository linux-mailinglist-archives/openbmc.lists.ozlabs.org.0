Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1004C547186
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 05:10:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKjWG6gmMz3byT
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 13:10:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YfOpf3Zv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YfOpf3Zv;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKjVr1bQvz3blg
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 13:09:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654916996; x=1686452996;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Qg8gzQMxhNBn7L1OM2gvQQcbtltxGx2N/zMlmJ9N3EA=;
  b=YfOpf3ZvV/tnrxcJMFl+kXM4aeVc8pZBuw6OiW0mIGB0WAlf2T64t1qQ
   /6zDWy3r3ZVxBSGBNOBS1vF2fZMKrzCGfI2xhZxS8E35fAFrjAn2M2A3K
   mGpOCk9P6bVnpibP/yR9P7GLe7qPE+d5deaCRIt/HpkRpQr1+GG3gLCR2
   fbFX8LPjBJM+SrhJ7JecU/8pdpW7Gx5XOhTD9sdC4kSORaPZmdwTFibAv
   fQHN8bnG1CsBsQkLen/P3ieqYIowJk6cURFBlU1mDNBnnrQdyvdlrn/GP
   Opo3hglBU/SHCDkHX5YCwoEaPJDgF1W0lLWU03c27VCKqgfQMNV83AIXe
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="339558552"
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="339558552"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 20:09:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="638495570"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.31.17]) ([10.255.31.17])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 20:09:44 -0700
Message-ID: <21c9ba6b-e84e-4545-44d2-5ffe5fea9581@linux.intel.com>
Date: Sat, 11 Jun 2022 11:09:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/6] dt-bindings: net: Add NCSI bindings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
 <20220610165940.2326777-6-jiaqing.zhao@linux.intel.com>
 <1654903146.313095.2450355.nullmailer@robh.at.kernel.org>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <1654903146.313095.2450355.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2022-06-11 07:19, Rob Herring wrote:
> On Sat, 11 Jun 2022 00:59:39 +0800, Jiaqing Zhao wrote:
>> Add devicetree bindings for NCSI VLAN modes. This allows VLAN mode to
>> be configured in devicetree.
>>
>> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>> ---
>>  .../devicetree/bindings/net/ncsi.yaml         | 34 +++++++++++++++++++
>>  MAINTAINERS                                   |  2 ++
>>  include/dt-bindings/net/ncsi.h                | 15 ++++++++
>>  3 files changed, 51 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/ncsi.yaml
>>  create mode 100644 include/dt-bindings/net/ncsi.h
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ncsi.yaml: 'oneOf' conditional failed, one must be fixed:
> 	'unevaluatedProperties' is a required property
> 	'additionalProperties' is a required property
> 	hint: Either unevaluatedProperties or additionalProperties must be present
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ncsi.yaml: ignoring, error in schema: 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ncsi.example.dtb: ethernet@1e660000: 'ncsi,vlan-mode' does not match any of the regexes
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml

I saw vendor-prefix.yaml says do not add non-vendor prefixes to the list. Since "ncsi" is not a vendor, may I ask what is the suggested replacement for 'ncsi,vlan-mode'? Will 'ncsi-vlan-mode' be fine?

> Documentation/devicetree/bindings/net/ncsi.example.dtb:0:0: /example-0/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
> Documentation/devicetree/bindings/net/ncsi.example.dtb:0:0: /example-0/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']

The ftgmac100 it depends on uses a txt document instead of an yaml schema. And I see there is other schemas having the same error, can this be ignored?

And I've got one more question. The ncsi driver does not has its own compatible field, instead, it is enabled by setting the "use-ncsi" property of some specific mac drivers. Though currently only ftgmac100 supports ncsi in upstream kernel, it may be used by other mac drivers in the future. What do you think is a proper way for defining the ncsi schema? Having it in a separate yaml like this patch or add the properties to all the mac yamls that supports yaml? If the former way is preferred, how should the schema be defined without "compatible"?

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
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
