Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB9845A6ED
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 16:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz7zm6Vw4z2ypL
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 02:56:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jBTtlGU7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jBTtlGU7; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz7zM3WLxz2xrP;
 Wed, 24 Nov 2021 02:56:13 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so34366111otj.7; 
 Tue, 23 Nov 2021 07:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=d7UN/gtMFD0+CfntgagBDCU3OFGLUJ14fJxOZRpFpSs=;
 b=jBTtlGU7wUCAayGuVcs+MGhonZwixiA3mxfhySHHgJi/8js6jxNFutgeP6ZeDFy6eo
 bRueqSE3q+ttWrdA38y5gt5cpRs8Cg8Iu+M6brzgIFtpgDKUVBS7EINqqEOluy4uNYaJ
 WipHeonFnSQKbMcReO55R/3Zc3BGfjy6Hg8xUl2iyvegzRBwrYGXr5INsmMAl/YXYyVE
 yZTPbTOvNIfNrJZBKsRwacNVDCI24aje4MfbTFZ16zD8A/ALpa2txk5sUScm11yKyg5G
 Yti0eh4bHUNgWczNpkAj9WUIputVNJ677alE28Mhq/vg7JyIQcJBZT2NzvBVTVWwVeeo
 q07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition;
 bh=d7UN/gtMFD0+CfntgagBDCU3OFGLUJ14fJxOZRpFpSs=;
 b=J47+XgYPJFIX4P5gU39cC0MS9BHVA2+WZiWi8pnBb/Pq8H3vg6JGMzNNBOToHovIK2
 NJpYiv+qeKGjZxRKM+k4UkqP4rLhWlh0ZaGgoU2DABBFmjCrm9OzDqeeMrAfqMcp4IaJ
 F9ZjWKlxjlLmcyAWNlaBvFJRTPzqaTrp1VKNVHTKK+jPH0r/N+Zp4hW7zlz5mZmp2ZGe
 c8sfwOSRpz9OnxqHh7jpH3vA//Ig2Ru01JjneGN8R6699K029Y6OMEMK6bXXmaKnC6Fi
 P6LFFOjv28eEiFSMoceNk1XeC2X83SuqLboZAMeZ65bq3lLVGPnv1JDvt5CIyo9dadpN
 wfoQ==
X-Gm-Message-State: AOAM530xVMuKjo6o0AO2kJ91kgs5dhngyyD4Q+ynbAXoaHk3SQ/Ec5Mc
 4czTCSVxDEfB/B6sNfyMfeA=
X-Google-Smtp-Source: ABdhPJzHGnMWkUtLsG4O+tAtmQGUp8qFfdDduM22WfEJrNkViM5QUIW5SQvrPEoueCL+oyG1ETpS8g==
X-Received: by 2002:a9d:749a:: with SMTP id t26mr5694122otk.96.1637682970071; 
 Tue, 23 Nov 2021 07:56:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k4sm2558888oij.54.2021.11.23.07.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 07:56:09 -0800 (PST)
Date: Tue, 23 Nov 2021 07:56:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v4 11/13] hwmon: peci: Add dimmtemp driver
Message-ID: <20211123155608.GA2258206@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 openbmc@lists.ozlabs.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 23, 2021 at 03:07:04PM +0100, Iwona Winiarska wrote:
> Add peci-dimmtemp driver for Temperature Sensor on DIMM readings that
> are accessible via the processor PECI interface.
> 
> The main use case for the driver (and PECI interface) is out-of-band
> management, where we're able to obtain thermal readings from an external
> entity connected with PECI, e.g. BMC on server platforms.
> 
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

[ ... ]

> +static int check_populated_dimms(struct peci_dimmtemp *priv)
> +{
> +	int chan_rank_max = priv->gen_info->chan_rank_max;
> +	int dimm_idx_max = priv->gen_info->dimm_idx_max;
> +	u32 chan_rank_empty = 0;
> +	u64 dimm_mask = 0;
> +	int chan_rank, dimm_idx, ret;
> +	u32 pcs;
> +
> +	BUILD_BUG_ON(BITS_PER_TYPE(chan_rank_empty) < CHAN_RANK_MAX);
> +	BUILD_BUG_ON(BITS_PER_TYPE(dimm_mask) < DIMM_NUMS_MAX);
> +	if (chan_rank_max * dimm_idx_max > DIMM_NUMS_MAX) {
> +		WARN_ONCE(1, "Unsupported number of DIMMs - chan_rank_max: %d, dimm_idx_max: %d",
> +			  chan_rank_max, dimm_idx_max);
> +		return -EINVAL;
> +	}
> +
> +	for (chan_rank = 0; chan_rank < chan_rank_max; chan_rank++) {
> +		ret = peci_pcs_read(priv->peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank, &pcs);
> +		if (ret) {
> +			/*
> +			 * Overall, we expect either success or -EINVAL in
> +			 * order to determine whether DIMM is populated or not.
> +			 * For anything else we fall back to deferring the
> +			 * detection to be performed at a later point in time.
> +			 */
> +			if (ret == -EINVAL) {
> +				chan_rank_empty |= BIT(chan_rank);
> +				continue;
> +			}
> +
> +			return -EAGAIN;
> +		}
> +
> +		for (dimm_idx = 0; dimm_idx < dimm_idx_max; dimm_idx++)
> +			if (__dimm_temp(pcs, dimm_idx))
> +				dimm_mask |= BIT(chan_rank * dimm_idx_max + dimm_idx);
> +	}
> +
> +	/*
> +	 * If we got all -EINVALs, it means that the CPU doesn't have any
> +	 * DIMMs. Unfortunately, it may also happen at the very start of
> +	 * host platform boot. Retrying a couple of times lets us make sure
> +	 * that the state is persistent.
> +	 */
> +	if (chan_rank_empty == GENMASK(chan_rank_max - 1, 0)) {
> +		if (priv->no_dimm_retry_count < NO_DIMM_RETRY_COUNT_MAX) {
> +			priv->no_dimm_retry_count++;
> +
> +			return -EAGAIN;
> +		} else {
> +			return -ENODEV;
> +		}

Static analyzers will complain "else after return is unnecessary".

Guenter
