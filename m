Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD49B4A89E4
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 18:24:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqQWs2chHz2xC6
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 04:24:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H194sma4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H194sma4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqQWQ5FV2z2xsb
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 04:24:02 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213G8CSN003400; 
 Thu, 3 Feb 2022 17:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=pSqROZNfIYiqiGamiHE+BEcNLeozos7vm38H6VUaXRY=;
 b=H194sma4ySIFYGUkJrnOOSYyhUgrUu22wcm6HAq1rREOsmJ288e7oWG50IM9GrM3clfd
 KcBwIDnLr+t3RilkrwRanvYHbrTTOosLU28UZK8mmpuejvGsVFgqbDfwLPKC9vaf5XB1
 PRxVd2ZysUpBvNIUSO8MsqnuPdyM+IqgnD2CBupJ3431GwLd9UvVNVMAL+6zUyBcjF3w
 5zJF7AW2vGNSFH+DSbILEMWisnCX/U6kbzoxrOWyR7ZZ38EIskz/PsX5RSbZTru3MxpT
 w67CHhM7H2nlo4ZoteHsQSO3UgmOSkl/TpgvIkbri81qsoW7jWMnBO1JLHic+DLTodf6 7g== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyygrfxsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:23:54 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213HD8kq001703;
 Thu, 3 Feb 2022 17:23:53 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 3dvw7bskne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:23:53 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213HNqHa23200132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 17:23:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A8DEAC062;
 Thu,  3 Feb 2022 17:23:52 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 013CEAC060;
 Thu,  3 Feb 2022 17:23:52 +0000 (GMT)
Received: from [9.163.28.41] (unknown [9.163.28.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 17:23:51 +0000 (GMT)
Message-ID: <1886bb03-dbb3-d1d8-5a06-c0f1f8636483@linux.ibm.com>
Date: Thu, 3 Feb 2022 11:23:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/6] gpio: Add
 gpio_request_by_line_name()
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220131012538.73021-1-andrew@aj.id.au>
 <20220131012538.73021-2-andrew@aj.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220131012538.73021-2-andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FTpyaYNIZuvzHQutVQ-TTFbzn9a1wbeQ
X-Proofpoint-GUID: FTpyaYNIZuvzHQutVQ-TTFbzn9a1wbeQ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030100
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


On 1/30/22 19:25, Andrew Jeffery wrote:
> Add support for the upstream gpio-line-names property already described
> in the common GPIO binding document[1]. The ability to search for a line
> name allows boards to lift the implementation of common GPIO behaviours
> away from specific line indexes on a GPIO controller.
>
> [1] https://github.com/devicetree-org/dt-schema/blob/3c35bfee83c2e38e2ae7af5f83eb89ca94a521e8/dtschema/schemas/gpio/gpio.yaml#L17


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/gpio/gpio-uclass.c | 26 ++++++++++++++++++++++++++
>   include/asm-generic/gpio.h | 19 +++++++++++++++++++
>   2 files changed, 45 insertions(+)
>
> diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
> index 219caa651bb2..425bbc5cb880 100644
> --- a/drivers/gpio/gpio-uclass.c
> +++ b/drivers/gpio/gpio-uclass.c
> @@ -878,6 +878,32 @@ int gpio_request_by_name(struct udevice *dev, const char *list_name, int index,
>   				 index, desc, flags, index > 0, NULL);
>   }
>   
> +int gpio_request_by_line_name(struct udevice *dev, const char *line_name,
> +			      struct gpio_desc *desc, int flags)
> +{
> +	int ret;
> +
> +	ret = dev_read_stringlist_search(dev, "gpio-line-names", line_name);
> +	if (ret < 0)
> +		return ret;
> +
> +	desc->dev = dev;
> +	desc->offset = ret;
> +	desc->flags = 0;
> +
> +	ret = dm_gpio_request(desc, line_name);
> +	if (ret) {
> +		debug("%s: dm_gpio_requestf failed\n", __func__);
> +		return ret;
> +	}
> +
> +	ret = dm_gpio_set_dir_flags(desc, flags | desc->flags);
> +	if (ret)
> +		debug("%s: dm_gpio_set_dir failed\n", __func__);
> +
> +	return ret;
> +}
> +
>   int gpio_request_list_by_name_nodev(ofnode node, const char *list_name,
>   				    struct gpio_desc *desc, int max_count,
>   				    int flags)
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index d6cf18744fda..6ed0ba11b6c1 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -451,6 +451,25 @@ int gpio_claim_vector(const int *gpio_num_array, const char *fmt);
>   int gpio_request_by_name(struct udevice *dev, const char *list_name,
>   			 int index, struct gpio_desc *desc, int flags);
>   
> +/* gpio_request_by_line_name - Locate and request a GPIO by line name
> + *
> + * Request a GPIO using the offset of the provided line name in the
> + * gpio-line-names property found in the OF node of the GPIO udevice.
> + *
> + * This allows boards to implement common behaviours using GPIOs while not
> + * requiring specific GPIO offsets be used.
> + *
> + * @dev:	An instance of a GPIO controller udevice
> + * @line_name:	The name of the GPIO (e.g. "bmc-secure-boot")
> + * @desc:	A GPIO descriptor that is populated with the requested GPIO
> + *              upon return
> + * @flags:	The GPIO settings apply to the request
> + * @return 0 if the named line was found and requested successfully, or a
> + * negative error code if the GPIO cannot be found or the request failed.
> + */
> +int gpio_request_by_line_name(struct udevice *dev, const char *line_name,
> +			      struct gpio_desc *desc, int flags);
> +
>   /**
>    * gpio_request_list_by_name() - Request a list of GPIOs
>    *
