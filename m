Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25C1C6A08
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 09:24:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H7Q91HZYzDql9
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 17:24:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vI2o+ISs; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H7PB59ckzDql6
 for <openbmc@lists.ozlabs.org>; Wed,  6 May 2020 17:23:42 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id t9so457546pjw.0
 for <openbmc@lists.ozlabs.org>; Wed, 06 May 2020 00:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=tOOG6n6rvJxhaVEtBR/7trQYlQsvenipgYrTIwz1vNU=;
 b=vI2o+ISsqy/NMXGL/sGiXGjD29/CXyf3wWbzLvgMTn3efCw2D5/gpYkFuMWBt51sG6
 whYoguL4jOot3TQ8Z+WzqOci4QhBB5NNh7NUdA5+DWYzHxSpQVcmGRktY8HQssERoOlp
 3EQQunE4X3cBWsN1IRI502cif47kuUFJ9TS0lVJoqWsEHvaSgWA1IDeA4/i7XNQLvvLM
 xHijGmZ3RS1InX9QdeTnr5r7kYvAL0haAwOVajpWiEPHI5FJc58x0RyXsNfiC7nhEYZs
 tqwwD5h4BNj01IDN0WGUdUMfUrQNV5pedA3ikfoSozoFscv2A5moYWo7c/haq5d1yrcO
 fEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tOOG6n6rvJxhaVEtBR/7trQYlQsvenipgYrTIwz1vNU=;
 b=DXIppZQ3BxAljAfGirGuoiTxMj5e0hn3zfyTAEOd8Tb1fL4TCXA1y4+IXbCsRdih93
 YN40eHTS8IkeIu6Li7fl6TgZbfTmMRxTKYrcsiT9xv7MScwUyRFnzXENqs6sl7ezpqFZ
 NssvXzLOC/vLB7nYLSeB3NmbB8L4l6GUClyGHn49DjtBbxeJ6pPabO1qCSszkBg5nulM
 M0pPiEdbIHgkYcE+GZTD4W1fDU9orGJzL4M1n16GHVgqfgTyem24hSJKi+CERChg+S7s
 PpFxiK4scr78qEIIixTeVl6eugfdmJ9wRhu3jbisk6+e2qLmZL5dH7n7kJ6QmWV4cKz3
 iehA==
X-Gm-Message-State: AGi0PuYzoYq4c78QLeynHYRQYi11oHbZ+Cw9wRSBw171YEX7XTwcz9KZ
 Fl0Opb2TXTdShK+DmVF20Imj5bBcBjo=
X-Google-Smtp-Source: APiQypKLe9Y9Nml6Q6F8tWhJy0BgJu30xDTvSLiYjj+G6fhDGpF6ucpmF/oMF4SH34OAmxLPFTmDEA==
X-Received: by 2002:a17:902:b711:: with SMTP id
 d17mr6605950pls.333.1588749817866; 
 Wed, 06 May 2020 00:23:37 -0700 (PDT)
Received: from ?IPv6:2401:4900:16ea:2863:a145:a244:f4c5:6f99?
 ([2401:4900:16ea:2863:a145:a244:f4c5:6f99])
 by smtp.gmail.com with ESMTPSA id x7sm952112pfj.122.2020.05.06.00.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 00:23:37 -0700 (PDT)
Subject: Re: Storing host data on the BMC
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, patrick@stwcx.xyz,
 dkodihal@in.ibm.com, suryakanth.sekar@linux.intel.com,
 openbmc <openbmc@lists.ozlabs.org>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
 <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
Date: Wed, 6 May 2020 12:53:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Deepak,

Please suggest which other approach you think is better here for Origin 
attribute?

When the interface is set as DHCPEnabled=true ; similar to the Origin 
attribute , the IP address, SubnetMask and Gateway will be set by the 
host. So we would need to consider this usecase also as a candidate for 
the new approach.

Thanks & regards,
Sunitha


On 05-05-2020 12:29, Deepak Kodihalli wrote:
> On 05/05/20 12:12 pm, Sunitha Harish wrote:
>> Hi Deepak,
>>
>> As mentioned , the Origin is the property which will be set by the 
>> host once the IP address is applied to its interface. Its a read-only 
>> property for the out-of-band user. But its a closely coupled - 
>> related attribute on the host setting/BIOS object.
>
> Hi Sunitha,
>
> What I'm trying to say is - we shouldn't make this coupling. The BIOS 
> settings table is a group of attributes that can alter the default 
> behavior of the host firmware. The Origin property you describe 
> doesn't fit that description.
>
> The host "sets" several things for the BMC, for eg the host firmware 
> can tell us functional/presence states of FRUs which the host has 
> access to. Everything that the host "sets" this way isn't a BIOS 
> attribute. Once you decouple this, I believe we can think about 
> options other than the two you have suggested - since both of them 
> involve making the Origin property seem like a BIOS attribute, which 
> it clearly is not.
>
> Thanks,
> Deepak
