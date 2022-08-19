Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 269EA59CC5C
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 01:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBTT20SqBz3c2W
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 09:43:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=NuFqKQ0G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=infineon.com (client-ip=2a00:18f0:1e00:4::4; helo=smtp2.infineon.com; envelope-from=alexander.steffen@infineon.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=NuFqKQ0G;
	dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir; Sat, 20 Aug 2022 00:19:24 AEST
Received: from smtp2.infineon.com (smtp2.infineon.com [IPv6:2a00:18f0:1e00:4::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8P5S5HsJz3cd6
	for <openbmc@lists.ozlabs.org>; Sat, 20 Aug 2022 00:19:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1660918765; x=1692454765;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NgWhD4dWyzjrDE1CQbWRA/1iPEDChC6Hw9sYbf5lvFg=;
  b=NuFqKQ0GmT7tkI03R2lAqK9ECpL6Z+h5syyZgxr6vlglWqwd+Bf/IAWb
   ObSViQyldYJCdbR6UImuO/GLw/25PtjKpOL7eEeKJ0LpF9Zy8zoqdQQyb
   MJk+sTJSQlyfnn6P0/n/TPxfFU2CGBh0Oc3OqAyZdipiUQHEFeg3f4vNX
   g=;
X-SBRS: None
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="195218507"
X-IronPort-AV: E=Sophos;i="5.93,248,1654552800"; 
   d="scan'208";a="195218507"
Received: from unknown (HELO mucxv001.muc.infineon.com) ([172.23.11.16])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 16:18:11 +0200
Received: from MUCSE822.infineon.com (MUCSE822.infineon.com [172.23.29.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mucxv001.muc.infineon.com (Postfix) with ESMTPS;
	Fri, 19 Aug 2022 16:18:11 +0200 (CEST)
Received: from MUCSE817.infineon.com (172.23.29.43) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 19 Aug
 2022 16:18:11 +0200
Received: from [10.165.68.85] (10.165.68.85) by MUCSE817.infineon.com
 (172.23.29.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 19 Aug
 2022 16:18:11 +0200
Message-ID: <fe96bfc2-9317-fb51-920b-6d041bc7c2f7@infineon.com>
Date: Fri, 19 Aug 2022 16:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] tpm: Pull tpm_tis_phy_ops and tpm_tis_i2c updates
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
References: <20220808220839.1006341-1-peter@pjd.dev>
From: Alexander Steffen <Alexander.Steffen@infineon.com>
In-Reply-To: <20220808220839.1006341-1-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.165.68.85]
X-ClientProxiedBy: MUCSE807.infineon.com (172.23.29.33) To
 MUCSE817.infineon.com (172.23.29.43)
X-Mailman-Approved-At: Tue, 23 Aug 2022 09:39:56 +1000
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Peter,

sorry for the late response.

On 09.08.22 00:08, Peter Delevoryas wrote:
> Alexander didn't include the compatible strings from the old driver,
> even though it should be compatible, so I've included a patch at the end
> which fixes that. I did it as a separate patch so that we maintain a
> patch series closer to what the upstream will be.

There were some objections to add them and/or to document them in 
trivial-devices.yaml, so I left them out to get at least the driver code 
merged. Makes sense to add them back if they are already in use.

I still plan to clean up the TPM compatibles and their documentation, to 
make it easier to manage them in the future, and then also add back the 
missing compatibles.

> cc'ing Alexander on this thread too to see if he has any suggestions, or
> thinks I missed anything.

Looks good to me.

Alexander
