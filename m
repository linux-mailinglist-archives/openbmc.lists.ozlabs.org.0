Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BB254A660
	for <lists+openbmc@lfdr.de>; Tue, 14 Jun 2022 04:33:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMXYk63WDz3bkg
	for <lists+openbmc@lfdr.de>; Tue, 14 Jun 2022 12:33:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5DhgQii;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5DhgQii;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMXYG6tf7z3bbv
	for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2022 12:33:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655174003; x=1686710003;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=47svbfWKkXZf9LfactisOBeorwmkIQeKErqvocVmXSE=;
  b=h5DhgQii8YwyMEYRGL3uXKH6FVD0/HU/83poJ0UJA6/FqASk422l7tD3
   zp/4CRjfe+774B/v03BZAjwmF5SKdadBSPWsWcafYiLo66Ng3MEr/F5uj
   1LQY8+JrcgADAIJVhKEm1aqyDmML2ZKwWyl9FtM7vk0YruhKGJP6EA9Xs
   z30ieyqVzGkCPBmeAThernGNPvhSuqjseYm8n35aP3+EUtHpwl9DG25+/
   m5rUMwOgHmqMaYABvw8raV7vfTMU+PRPjUueujpSQPyhTqtfMQRofTe4N
   EW9zbdnVezT7HIpoqwIUDcW1x1tgm/X/8zhX1pKMPhaeK1A8u4c4XY+QQ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="342448506"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="342448506"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 19:33:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="588157874"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.238.1.239]) ([10.238.1.239])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 19:33:12 -0700
Message-ID: <aff542a3-ac98-c33d-9612-63ebca180e17@linux.intel.com>
Date: Tue, 14 Jun 2022 10:33:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/6] dt-bindings: net: Add NCSI bindings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
 <20220610165940.2326777-6-jiaqing.zhao@linux.intel.com>
 <1654903146.313095.2450355.nullmailer@robh.at.kernel.org>
 <21c9ba6b-e84e-4545-44d2-5ffe5fea9581@linux.intel.com>
 <CAL_Jsq+y3tkfLV8UpUe6jw7Fq7YDrzwoq3FKK4jeeZEBOxhM4g@mail.gmail.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <CAL_Jsq+y3tkfLV8UpUe6jw7Fq7YDrzwoq3FKK4jeeZEBOxhM4g@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2022-06-13 23:28, Rob Herring wrote:
> On Fri, Jun 10, 2022 at 9:09 PM Jiaqing Zhao
> <jiaqing.zhao@linux.intel.com> wrote:
>>
>> On 2022-06-11 07:19, Rob Herring wrote:
>>> On Sat, 11 Jun 2022 00:59:39 +0800, Jiaqing Zhao wrote:
>>>> Add devicetree bindings for NCSI VLAN modes. This allows VLAN mode to
>>>> be configured in devicetree.
>>>>
>>>> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>>>> ---
>>>>  .../devicetree/bindings/net/ncsi.yaml         | 34 +++++++++++++++++++
>>>>  MAINTAINERS                                   |  2 ++
>>>>  include/dt-bindings/net/ncsi.h                | 15 ++++++++
>>>>  3 files changed, 51 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/net/ncsi.yaml
>>>>  create mode 100644 include/dt-bindings/net/ncsi.h
>>>>
>>>
>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ncsi.yaml: 'oneOf' conditional failed, one must be fixed:
>>>       'unevaluatedProperties' is a required property
>>>       'additionalProperties' is a required property
>>>       hint: Either unevaluatedProperties or additionalProperties must be present
>>>       from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ncsi.yaml: ignoring, error in schema:
>>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ncsi.example.dtb: ethernet@1e660000: 'ncsi,vlan-mode' does not match any of the regexes
>>>       From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>
>> I saw vendor-prefix.yaml says do not add non-vendor prefixes to the list. Since "ncsi" is not a vendor, may I ask what is the suggested replacement for 'ncsi,vlan-mode'? Will 'ncsi-vlan-mode' be fine?
> 
> I don't know. What is NCSI? Is it specific to certain MACs? Why do you
> need to set this up in DT? Network configuration is typically done in
> userspace, so putting VLAN config in DT doesn't seem right. All
> questions your commit message should answer.

NCSI is a protocol that uses an external MAC+PHY like a PHY, the
topology looks like:

         Packets + NCSI commands              Packets
     MAC-------------------------External MAC---------PHY

Some MACs like ftgmac100 driver supports using NCSI instead of PHY,
the operation mode is configured by a DT option "use-ncsi". The NCSI
external MAC has its own configuration, like VLAN filter mode of it,
and all NCSI devices uses a generic driver. So I these external mac
configurations to DT as they are device properties to kernel. Userspace
is only able to configure the "internal" MAC.

>>> Documentation/devicetree/bindings/net/ncsi.example.dtb:0:0: /example-0/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
>>> Documentation/devicetree/bindings/net/ncsi.example.dtb:0:0: /example-0/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
>>
>> The ftgmac100 it depends on uses a txt document instead of an yaml schema. And I see there is other schemas having the same error, can this be ignored?
> 
> No. Don't add to the list. Once all the existing warnings (~40) are
> fixed, then this will be turned on by default.

Sure, I'll put this to ftgmac100.txt instead of separate yaml file.

>>
>> And I've got one more question. The ncsi driver does not has its own compatible field, instead, it is enabled by setting the "use-ncsi" property of some specific mac drivers. Though currently only ftgmac100 supports ncsi in upstream kernel, it may be used by other mac drivers in the future. What do you think is a proper way for defining the ncsi schema? Having it in a separate yaml like this patch or add the properties to all the mac yamls that supports yaml? If the former way is preferred, how should the schema be defined without "compatible"?
> 
> If it is a function of driver support or not, then it doesn't belong in DT.
> 
> Rob

It's a hardware operation mode of the external MAC, I think it's
reasonable to put it in DT.

There is also a previous patch adding NCSI MAC config "mlx,multi-host"
in DT at https://lore.kernel.org/netdev/20200108234341.2590674-1-vijaykhemka@fb.com/T/
I referred this for my implementation, though it is undocumented.

Jiaqing
