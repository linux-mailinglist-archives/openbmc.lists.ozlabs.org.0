Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D94C3E0C19
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 21:00:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yNBK2vj8zDqJ8
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 06:00:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yMng411lzDqGG
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 05:42:46 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 11:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; d="scan'208";a="200883445"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga003.jf.intel.com with ESMTP; 22 Oct 2019 11:42:43 -0700
Subject: Re: [PATCH linux dev-5.3 2/4] pinctrl: aspeed-g6: Fix LPC/eSPI mux
 configuration
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20191022044737.15103-1-andrew@aj.id.au>
 <20191022044737.15103-3-andrew@aj.id.au>
 <081e769c-7f48-d8d9-9c7f-6715c895640c@linux.intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b6a3c0af-a6e3-e122-02c4-44a18138f66d@linux.intel.com>
Date: Tue, 22 Oct 2019 11:42:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <081e769c-7f48-d8d9-9c7f-6715c895640c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/22/2019 11:34 AM, Jae Hyun Yoo wrote:
> Hi Andrew,
> 
> On 10/21/2019 9:47 PM, Andrew Jeffery wrote:
>> Early revisions of the AST2600 datasheet are conflicted about the state
>> of the LPC/eSPI strapping bit (SCU510[6]). Conversations with ASPEED
>> determined that the reference pinmux configuration tables were in error
>> and the SCU documentation contained the correct configuration. Update
>> the driver to reflect the state described in the SCU documentation.
>>
>> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 56 ++++++++++------------
>>   1 file changed, 24 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
>> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>> index eb0c11a9fbf2..fb96e8d2e6c8 100644
>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>> @@ -1098,61 +1098,53 @@ SSSF_PIN_DECL(AD15, GPIOV6, LPCPME, 
>> SIG_DESC_SET(SCU434, 14));
>>   SSSF_PIN_DECL(AF15, GPIOV7, LPCSMI, SIG_DESC_SET(SCU434, 15));
>>   #define AB7 176
>> -SIG_EXPR_LIST_DECL_SESG(AB7, LAD0, LPC, SIG_DESC_SET(SCU434, 16),
>> -              SIG_DESC_CLEAR(SCU510, 6));
>> -SIG_EXPR_LIST_DECL_SESG(AB7, ESPID0, ESPI, SIG_DESC_SET(SCU434, 16),
>> -              SIG_DESC_SET(SCU510, 6));
>> +SIG_EXPR_LIST_DECL_SESG(AB7, LAD0, LPC, SIG_DESC_SET(SCU510, 6),
>> +            SIG_DESC_SET(SCU434, 16));
>> +SIG_EXPR_LIST_DECL_SESG(AB7, ESPID0, ESPI, SIG_DESC_SET(SCU434, 16));
>>   PIN_DECL_2(AB7, GPIOW0, LAD0, ESPID0);
>>   #define AB8 177
>> -SIG_EXPR_LIST_DECL_SESG(AB8, LAD1, LPC, SIG_DESC_SET(SCU434, 17),
>> -              SIG_DESC_CLEAR(SCU510, 6));
>> -SIG_EXPR_LIST_DECL_SESG(AB8, ESPID1, ESPI, SIG_DESC_SET(SCU434, 17),
>> -              SIG_DESC_SET(SCU510, 6));
>> +SIG_EXPR_LIST_DECL_SESG(AB8, LAD1, LPC, SIG_DESC_SET(SCU510, 6),
>> +            SIG_DESC_SET(SCU434, 17));
>> +SIG_EXPR_LIST_DECL_SESG(AB8, ESPID1, ESPI, SIG_DESC_SET(SCU434, 17));
>>   PIN_DECL_2(AB8, GPIOW1, LAD1, ESPID1);
>>   #define AC8 178
>> -SIG_EXPR_LIST_DECL_SESG(AC8, LAD2, LPC, SIG_DESC_SET(SCU434, 18),
>> -              SIG_DESC_CLEAR(SCU510, 6));
>> -SIG_EXPR_LIST_DECL_SESG(AC8, ESPID2, ESPI, SIG_DESC_SET(SCU434, 18),
>> -              SIG_DESC_SET(SCU510, 6));
>> +SIG_EXPR_LIST_DECL_SESG(AC8, LAD2, LPC, SIG_DESC_SET(SCU510, 6),
>> +            SIG_DESC_SET(SCU434, 18));
>> +SIG_EXPR_LIST_DECL_SESG(AC8, ESPID2, ESPI, SIG_DESC_SET(SCU434, 18));
>>   PIN_DECL_2(AC8, GPIOW2, LAD2, ESPID2);
>>   #define AC7 179
>> -SIG_EXPR_LIST_DECL_SESG(AC7, LAD3, LPC, SIG_DESC_SET(SCU434, 19),
>> -              SIG_DESC_CLEAR(SCU510, 6));
>> -SIG_EXPR_LIST_DECL_SESG(AC7, ESPID3, ESPI, SIG_DESC_SET(SCU434, 19),
>> -              SIG_DESC_SET(SCU510, 6));
>> +SIG_EXPR_LIST_DECL_SESG(AC7, LAD3, LPC, SIG_DESC_SET(SCU510, 6),
>> +            SIG_DESC_SET(SCU434, 19));
>> +SIG_EXPR_LIST_DECL_SESG(AC7, ESPID3, ESPI, SIG_DESC_SET(SCU434, 19));
>>   PIN_DECL_2(AC7, GPIOW3, LAD3, ESPID3);
>>   #define AE7 180
>> -SIG_EXPR_LIST_DECL_SESG(AE7, LCLK, LPC, SIG_DESC_SET(SCU434, 20),
>> -              SIG_DESC_CLEAR(SCU510, 6));
>> -SIG_EXPR_LIST_DECL_SESG(AE7, ESPICK, ESPI, SIG_DESC_SET(SCU434, 20),
>> -              SIG_DESC_SET(SCU510, 6));
>> +SIG_EXPR_LIST_DECL_SESG(AE7, LCLK, LPC, SIG_DESC_SET(SCU510, 6),
>> +            SIG_DESC_SET(SCU434, 20));
>> +SIG_EXPR_LIST_DECL_SESG(AE7, ESPICK, ESPI, SIG_DESC_SET(SCU434, 20));
>>   PIN_DECL_2(AE7, GPIOW4, LCLK, ESPICK);
>>   #define AF7 181
>> -SIG_EXPR_LIST_DECL_SESG(AF7, LFRAME, LPC, SIG_DESC_SET(SCU434, 21),
>> -              SIG_DESC_CLEAR(SCU510, 6));
>> -SIG_EXPR_LIST_DECL_SESG(AF7, ESPICS, ESPI, SIG_DESC_SET(SCU434, 21),
>> -              SIG_DESC_SET(SCU510, 6));
>> +SIG_EXPR_LIST_DECL_SESG(AF7, LFRAME, LPC, SIG_DESC_SET(SCU510, 6),
>> +            SIG_DESC_SET(SCU434, 21));
>> +SIG_EXPR_LIST_DECL_SESG(AF7, ESPICS, ESPI, SIG_DESC_SET(SCU434, 21));
>>   PIN_DECL_2(AF7, GPIOW5, LFRAME, ESPICS);
>>   #define AD7 182
>> -SIG_EXPR_LIST_DECL_SESG(AD7, LSIRQ, LSIRQ, SIG_DESC_SET(SCU434, 22),
>> -              SIG_DESC_CLEAR(SCU510, 6));
>> -SIG_EXPR_LIST_DECL_SESG(AD7, ESPIALT, ESPIALT, SIG_DESC_SET(SCU434, 22),
>> -              SIG_DESC_SET(SCU510, 6));
>> +SIG_EXPR_LIST_DECL_SESG(AD7, LSIRQ, LSIRQ, SIG_DESC_SET(SCU510, 6),
>> +            SIG_DESC_SET(SCU434, 22));
>> +SIG_EXPR_LIST_DECL_SESG(AD7, ESPIALT, ESPIALT, SIG_DESC_SET(SCU434, 
>> 22));
>>   PIN_DECL_2(AD7, GPIOW6, LSIRQ, ESPIALT);
>>   FUNC_GROUP_DECL(LSIRQ, AD7);
>>   FUNC_GROUP_DECL(ESPIALT, AD7);
>>   #define AD8 183
>> -SIG_EXPR_LIST_DECL_SESG(AD8, LPCRST, LPC, SIG_DESC_SET(SCU434, 23),
>> -              SIG_DESC_CLEAR(SCU510, 6));
>> -SIG_EXPR_LIST_DECL_SESG(AD8, ESPIRST, ESPI, SIG_DESC_SET(SCU434, 23),
>> -              SIG_DESC_SET(SCU510, 6));
>> +SIG_EXPR_LIST_DECL_SESG(AD8, LPCRST, LPC, SIG_DESC_SET(SCU510, 6),
>> +            SIG_DESC_SET(SCU434, 23));
>> +SIG_EXPR_LIST_DECL_SESG(AD8, ESPIRST, ESPI, SIG_DESC_SET(SCU434, 23));
>>   PIN_DECL_2(AD8, GPIOW7, LPCRST, ESPIRST);
>>   FUNC_GROUP_DECL(LPC, AB7, AB8, AC8, AC7, AE7, AF7, AD8);
> 
> Does it need AD7 too in this group?
> 
> I think it should be:
> FUNC_GROUP_DECL(LPC, AB7, AB8, AC8, AC7, AE7, AF7, AD7, AD8);
> FUNC_GROUP_DECL(ESPI, AB7, AB8, AC8, AC7, AE7, AF7, AD7, AD8);

Ah, I realized that there are seperate group definitions for LSIRQ and
ESPIALT. Ignore my comment.

Cheers,

Jae



