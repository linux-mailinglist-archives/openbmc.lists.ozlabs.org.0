Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA7C4A89E2
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 18:23:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqQVt0PNnz3bYv
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 04:23:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pbpM1bBg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pbpM1bBg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqQVP575Kz2xsb
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 04:23:08 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213Gjkg6021714; 
 Thu, 3 Feb 2022 17:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rljJJk6FR8eX6W/u3fN3S6he45xIpCu7EnMCUteSZUQ=;
 b=pbpM1bBgxWVU+0XyG8jTNp8StwkkH9BhXYs57n5SF8/YLIaix4Pjc6//JFLXztMGJ3al
 apS/HUafAr2qY7jkWcp5QiQZcV4ZMl0hUv/8FAEybsKKtPUAhpAFJcQ2GbS77bGXHjf7
 IVsJl/Nw9h6e348G4nIVjUAInPEW09gPWFgFEz6Q5vFov7zwsyvOome5GjfwHZjTyxPI
 yuyxVZ/RPamrRzRdu4O4UnHKDv9y8dWaHtGrc9QtPwCuaAR51xM+QIdizEl7MMKIPSVL
 ULDyNGUPAoDojOqzYPOLTzgJzlBj9RcOl2AjrWBvuTY6MCsVC6l8akgXwRS3MVgCQ/Oj pg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyvcmw4rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:22:58 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213HCsw3010097;
 Thu, 3 Feb 2022 17:22:57 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3dvw7csbve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:22:57 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213HMulI28508610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 17:22:56 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83152AC060;
 Thu,  3 Feb 2022 17:22:56 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20A31AC05B;
 Thu,  3 Feb 2022 17:22:56 +0000 (GMT)
Received: from [9.163.28.41] (unknown [9.163.28.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 17:22:55 +0000 (GMT)
Message-ID: <4758ac21-4214-0f26-8ba7-fa3b2ee39f76@linux.ibm.com>
Date: Thu, 3 Feb 2022 11:22:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/6] image: Control FIT
 uImage signature verification at runtime
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220131012538.73021-1-andrew@aj.id.au>
 <20220131012538.73021-3-andrew@aj.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220131012538.73021-3-andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ovOiuii2_sVW1nI4vz7c0NXP0U3IISqO
X-Proofpoint-ORIG-GUID: ovOiuii2_sVW1nI4vz7c0NXP0U3IISqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030103
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
> Some platform designs include support for disabling secure-boot via a
> jumper on the board. Sometimes this control can be separate from the
> mechanism enabling the root-of-trust for the platform. Add support for
> this latter scenario by allowing boards to implement
> board_fit_image_require_verfied(), which is then invoked in the usual
> FIT verification paths.


Reviewed-by: Eddie James <eajames@linux.ibm.com


>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   Kconfig            |  9 +++++++++
>   common/image-fit.c | 17 +++++++++++++++--
>   include/image.h    |  9 +++++++++
>   3 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/Kconfig b/Kconfig
> index c3dfa8de47c8..11f796035ae4 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -322,6 +322,15 @@ config FIT_SIGNATURE
>   	  format support in this case, enable it using
>   	  CONFIG_IMAGE_FORMAT_LEGACY.
>   
> +if FIT_SIGNATURE
> +config FIT_RUNTIME_SIGNATURE
> +	bool "Control verification of FIT uImages at runtime"
> +	help
> +	  This option allows board support to disable verification of
> +	  signatures at runtime, for example through the state of a GPIO.
> +endif # FIT_SIGNATURE
> +
> +
>   config FIT_SIGNATURE_MAX_SIZE
>   	hex "Max size of signed FIT structures"
>   	depends on FIT_SIGNATURE
> diff --git a/common/image-fit.c b/common/image-fit.c
> index 3c8667f93de2..eb1e66b02b68 100644
> --- a/common/image-fit.c
> +++ b/common/image-fit.c
> @@ -1199,6 +1199,14 @@ static int fit_image_check_hash(const void *fit, int noffset, const void *data,
>   	return 0;
>   }
>   
> +#ifndef __weak
> +#define __weak
> +#endif
> +__weak int board_fit_image_require_verified(void)
> +{
> +	return 1;
> +}
> +
>   int fit_image_verify_with_data(const void *fit, int image_noffset,
>   			       const void *data, size_t size)
>   {
> @@ -1209,6 +1217,7 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
>   
>   	/* Verify all required signatures */
>   	if (IMAGE_ENABLE_VERIFY &&
> +	    fit_image_require_verified() &&
>   	    fit_image_verify_required_sigs(fit, image_noffset, data, size,
>   					   gd_fdt_blob(), &verify_all)) {
>   		err_msg = "Unable to verify required signature";
> @@ -1230,7 +1239,9 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
>   						 &err_msg))
>   				goto error;
>   			puts("+ ");
> -		} else if (IMAGE_ENABLE_VERIFY && verify_all &&
> +		} else if (IMAGE_ENABLE_VERIFY &&
> +				fit_image_require_verified() &&
> +				verify_all &&
>   				!strncmp(name, FIT_SIG_NODENAME,
>   					strlen(FIT_SIG_NODENAME))) {
>   			ret = fit_image_check_sig(fit, noffset, data,
> @@ -1849,7 +1860,9 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
>   		if (image_type == IH_TYPE_KERNEL)
>   			images->fit_uname_cfg = fit_base_uname_config;
>   
> -		if (IMAGE_ENABLE_VERIFY && images->verify) {
> +		if (IMAGE_ENABLE_VERIFY &&
> +				fit_image_require_verified() &&
> +				images->verify) {
>   			puts("   Verifying Hash Integrity ... ");
>   			if (fit_config_verify(fit, cfg_noffset)) {
>   				puts("Bad Data Hash\n");
> diff --git a/include/image.h b/include/image.h
> index 937c7eee8ffb..19ea743af08f 100644
> --- a/include/image.h
> +++ b/include/image.h
> @@ -1103,6 +1103,15 @@ int calculate_hash(const void *data, int data_len, const char *algo,
>   # define IMAGE_ENABLE_VERIFY	0
>   #endif
>   
> +/*
> + * Further, allow run-time control of verification, e.g. via a jumper
> + */
> +#if defined(CONFIG_FIT_RUNTIME_SIGNATURE)
> +# define fit_image_require_verified()	board_fit_image_require_verified()
> +#else
> +# define fit_image_require_verified()	IMAGE_ENABLE_VERIFY
> +#endif
> +
>   #ifdef USE_HOSTCC
>   void *image_get_host_blob(void);
>   void image_set_host_blob(void *host_blob);
