Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB646545DDD
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 09:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKCt95qmkz3c7l
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 17:54:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=178.33.254.192; helo=3.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 3.mo552.mail-out.ovh.net (3.mo552.mail-out.ovh.net [178.33.254.192])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKCsr25lHz305H
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 17:54:37 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9B27C292C7;
	Fri, 10 Jun 2022 07:54:31 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 10 Jun
 2022 09:54:30 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-110S0049a9ae0af-6533-4b22-ad35-8350c4c2ba1c,
                    47EE32455EA4CDBAEFF6DF707BD4A273D3E287E7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0e3eb1a1-a370-fc48-1f88-032d2ca436c2@kaod.org>
Date: Fri, 10 Jun 2022 09:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add a palmetto board (AST2400)
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220608082221.460166-1-clg@kaod.org>
 <20220608101727.GR11809@packtop>
 <4c2702c7-14ee-df07-5c5c-eca257947536@kaod.org>
 <CACPK8XdzQi_tyRS05OXBeWAMKUJjCnr0B=SSRA=FKUtX1ppFuw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XdzQi_tyRS05OXBeWAMKUJjCnr0B=SSRA=FKUtX1ppFuw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c66ff935-203e-4273-8cdf-46436616d8d2
X-Ovh-Tracer-Id: 17921793243885308893
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddutddguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehhedv
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/10/22 08:49, Joel Stanley wrote:
>> No because of NCSI support. net_loop() would need some tweak to
>> avoid configuring NCSI if the DT has no advertise support.
>>
>> Here is a tentative try below, tested on the AST2500 EVB.
> 
> Thanks for the patch. I tested it in qemu for rainier (p10bmc) and
> ast2600 evb + CONFIG_PHY_NCSI=y and it worked.
> 
>   I then tested on hardware and it failed, as it seems we're still
> trying to talk ncsi. Here's the call stack when running 'dhcp' from
> the u-boot command line:
> 
> #0  ncsi_startup (phydev=0xbcf76bc8) at ../drivers/net/phy/ncsi.c:862
> #1  0xbef95e28 in ftgmac100_start (dev=<optimized out>) at
> ../drivers/net/ftgmac100.c:378
> #2  0xbefbf488 in eth_init () at ../net/eth-uclass.c:275
> #3  0xbefc0814 in net_loop (protocol=DHCP) at ../net/net.c:426
> 
> ftgmac100_phy_init is calling phy_connect, and it's connecting the
> ncsi phy driver:
> 
> struct phy_device *phy_connect(struct mii_dev *bus, int addr,
>                                 struct eth_device *dev,
>                                 phy_interface_t interface)
> {
>          struct phy_device *phydev = NULL;
>          uint mask = (addr > 0) ? (1 << addr) : 0xffffffff;
> 
> #ifdef CONFIG_PHY_FIXED
>          phydev = phy_connect_fixed(bus, dev, interface);
> #endif
> 
> #ifdef CONFIG_PHY_NCSI
>          phydev = phy_device_create(bus, 0, PHY_NCSI_ID, false, interface);
> #endif

That's ugly :/ and we have the ncsi information in the caller.

> This logic will need to be fixed so we only set ncsi if the device
> tree specifies it.

yes. Something like :

@@ -932,7 +932,13 @@ struct phy_device *phy_connect(struct mi
  #endif
  
  #ifdef CONFIG_PHY_NCSI
-	phydev = phy_device_create(bus, 0, PHY_NCSI_ID, false, interface);
+	{
+		struct eth_pdata *pdata = dev_get_platdata(dev);
+
+		if (pdata->phy_interface == PHY_INTERFACE_MODE_NCSI)
+			phydev = phy_device_create(bus, 0, PHY_NCSI_ID,
+						   false, interface);
+	}
  #endif
  
  	if (!phydev)


?

C.


>> Subject: [PATCH] net: phy: ncsi: Add phy_interface_is_ncsi() helper
> 
>> --- a/drivers/net/phy/phy.c
>> +++ b/drivers/net/phy/phy.c
>> @@ -988,3 +988,10 @@ int phy_get_interface_by_name(const char *str)
>>
>>          return -1;
>>    }
>> +
>> +bool phy_interface_is_ncsi(void)
>> +{
>> +       struct eth_pdata *pdata = dev_get_platdata(eth_get_dev());
> 
> 
>> +
>> +       return pdata->phy_interface == PHY_INTERFACE_MODE_NCSI;
>> +}
>> diff --git a/net/net.c b/net/net.c
>> index f0f9cd4d946b..8449445bf65c 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -409,7 +409,7 @@ int net_loop(enum proto_t protocol)
>>          debug_cond(DEBUG_INT_STATE, "--- net_loop Entry\n");
>>
>>    #ifdef CONFIG_PHY_NCSI
>> -       if (protocol != NCSI && !ncsi_active()) {
>> +       if (phy_interface_is_ncsi() && protocol != NCSI && !ncsi_active()) {
>>                  printf("Configuring NCSI\n");
>>                  if (net_loop(NCSI) < 0)
>>                          return ret;
>> --
>> 2.35.3
>>
>>
>>

