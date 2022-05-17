Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4180C529920
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 07:45:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Q7h0fjwz3c7l
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 15:45:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.81;
 helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Q7P6LBvz3bWG
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 15:45:02 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D64671008C797;
 Tue, 17 May 2022 07:44:55 +0200 (CEST)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 17 May
 2022 07:44:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0049fbbfdd4-788d-493c-9712-a897233880ae,
 BB146B841C735870D6401592F5D215EFF71F43F0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ab0ef71d-8070-c358-1c75-2fbade20c727@kaod.org>
Date: Tue, 17 May 2022 07:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ftgmac100: use bus name in mdio error messages
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, Joel Stanley <joel@jms.id.au>,
 <openbmc@lists.ozlabs.org>
References: <20220517043825.26893-1-zev@bewilderbeest.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220517043825.26893-1-zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8571cef0-d41d-467a-b0cf-d1161a1cf186
X-Ovh-Tracer-Id: 3915598405153819555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeigdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhihrghnpggthhgvnhesrghsphgvvgguthgvtghhrdgtohhm
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Zev,

On 5/17/22 06:38, Zev Weiss wrote:
> Previously we'd been using a device name retrieved via
> ftgmac100_data->phydev, but the mdio read/write functions may be
> called before that member is initialized in ftgmac100_phy_init(),
> leading to a NULL pointer dereference while printing the error message
> issued if the mdio access fails.  We can instead use bus->name, which
> is already available at that point.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Fixes: 538e75d3fc54 ("net: ftgmac100: add MDIO bus and phylib support")

You should send upstream.

Thanks,

C.

> ---
>   drivers/net/ftgmac100.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
> index 999941de14ac..aa1d63880c8c 100644
> --- a/drivers/net/ftgmac100.c
> +++ b/drivers/net/ftgmac100.c
> @@ -117,7 +117,7 @@ static int ftgmac100_mdio_read(struct mii_dev *bus, int phy_addr, int dev_addr,
>   				 FTGMAC100_MDIO_TIMEOUT_USEC);
>   	if (ret) {
>   		pr_err("%s: mdio read failed (phy:%d reg:%x)\n",
> -		       priv->phydev->dev->name, phy_addr, reg_addr);
> +		       bus->name, phy_addr, reg_addr);
>   		return ret;
>   	}
>   
> @@ -149,7 +149,7 @@ static int ftgmac100_mdio_write(struct mii_dev *bus, int phy_addr, int dev_addr,
>   				 FTGMAC100_MDIO_TIMEOUT_USEC);
>   	if (ret) {
>   		pr_err("%s: mdio write failed (phy:%d reg:%x)\n",
> -		       priv->phydev->dev->name, phy_addr, reg_addr);
> +		       bus->name, phy_addr, reg_addr);
>   	}
>   
>   	return ret;

