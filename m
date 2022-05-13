Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC4525AF5
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 07:11:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzxZs25K9z3cGB
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 15:11:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzxZZ0Cclz3bqb
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 15:11:31 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aeb24.dynamic.kabel-deutschland.de
 [95.90.235.36])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id DBFB461EA1928;
 Fri, 13 May 2022 07:11:25 +0200 (CEST)
Message-ID: <b6da2e5a-eb85-d3cf-d4c3-ca9c0f0c04a4@molgen.mpg.de>
Date: Fri, 13 May 2022 07:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH net v2] net: ftgmac100: Disable hardware checksum on
 AST2600
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220512231938.228651-1-joel@jms.id.au>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220512231938.228651-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: David Wilder <dwilder@us.ibm.com>, openbmc@lists.ozlabs.org,
 David Wilder <wilder@us.ibm.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joel,


Am 13.05.22 um 01:19 schrieb Joel Stanley:
> The AST2600 when using the i210 NIC over NC-SI has been observed to
> produce incorrect checksum results with specific MTU values. This was
> first observed when sending data across a long distance set of networks.
> 
> On a local network, the following test was performed using a 1MB file of
> random data.
> 
> On the receiver run this script:
> 
>   #!/bin/bash
>   while [ 1 ]; do
>          # Zero the stats
>          nstat -r  > /dev/null
>          nc -l 9899 > test-file
>          # Check for checksum errors
>          TcpInCsumErrors=$(nstat | grep TcpInCsumErrors)
>          if [ -z "$TcpInCsumErrors" ]; then
>                  echo No TcpInCsumErrors
>          else
>                  echo TcpInCsumErrors = $TcpInCsumErrors
>          fi
>   done
> 
> On an AST2600 system:
> 
>   # nc <IP of  receiver host> 9899 < test-file
> 
> The test was repeated with various MTU values:
> 
>   # ip link set mtu 1410 dev eth0
> 
> The observed results:
> 
>   1500 - good
>   1434 - bad
>   1400 - good
>   1410 - bad
>   1420 - good

Sort the values? As some MTUs are good, should a allow list for these 
values be added?

> The test was repeated after disabling tx checksumming:
> 
>   # ethtool -K eth0 tx-checksumming off
> 
> And all MTU values tested resulted in transfers without error.
> 
> An issue with the driver cannot be ruled out, however there has been no
> bug discovered so far.
> 
> David has done the work to take the original bug report of slow data
> transfer between long distance connections and triaged it down to this
> test case.
> 
> The vendor suspects this this is a hardware issue when using NC-SI. The fixes line refers
> to the patch that introduced AST2600 support.

Please wrap the line after 75 characters.

Can the problem be reproduced with QEMU?

> Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle property")
> Reported-by: David Wilder <wilder@us.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Should the intel-wired-lan folks be put in Cc?

> ---
> v2 updates the commit message with confirmation form the vendor that

from

> this is a hardware issue, and clarifes why the commit used in the fixes

clarifies

> tag was chosen.
> 
>   drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index caf48023f8ea..5231818943c6 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1928,6 +1928,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
>   	/* AST2400  doesn't have working HW checksum generation */
>   	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
>   		netdev->hw_features &= ~NETIF_F_HW_CSUM;
> +
> +	/* AST2600 tx checksum with NC-SI is broken */

Does ASPEED have an internal bug for this, so should there be new 
revisions of the AST2600, the bug can be fixed?

> +	if (priv->use_ncsi && of_device_is_compatible(np, "aspeed,ast2600-mac"))
> +		netdev->hw_features &= ~NETIF_F_HW_CSUM;
> +

I would fancy a note or even warning about this hardware issue.

>   	if (np && of_get_property(np, "no-hw-checksum", NULL))
>   		netdev->hw_features &= ~(NETIF_F_HW_CSUM | NETIF_F_RXCSUM);
>   	netdev->features |= netdev->hw_features;


Kind regards,

Paul
