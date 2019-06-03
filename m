Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBDB331D8
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 16:16:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HcYk098RzDqV5
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 00:16:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HcXr21WZzDqS1
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 00:15:55 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53EDeFI032907; Mon, 3 Jun 2019 10:15:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sw43tun8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2019 10:15:51 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x53EE1Nr034829;
 Mon, 3 Jun 2019 10:15:49 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sw43tun85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2019 10:15:49 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x538Iq6F010304;
 Mon, 3 Jun 2019 08:20:50 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 2suh090b8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2019 08:20:50 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x53EFla719268064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jun 2019 14:15:47 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DFEB136053;
 Mon,  3 Jun 2019 14:15:47 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32C2D136055;
 Mon,  3 Jun 2019 14:15:46 +0000 (GMT)
Received: from [9.80.195.63] (unknown [9.80.195.63])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jun 2019 14:15:45 +0000 (GMT)
Subject: Re: [PATCH] i2c: fsi: Create busses for all ports
To: "Oliver O'Halloran" <oohall@gmail.com>, linux-i2c@vger.kernel.org
References: <20190603055714.7203-1-oohall@gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <e546c15f-07a9-656a-ce11-4f9a24795d9a@linux.ibm.com>
Date: Mon, 3 Jun 2019 09:15:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190603055714.7203-1-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906030100
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 6/3/19 12:57 AM, Oliver O'Halloran wrote:
> Currently we only create an I2C bus for the ports listed in the
> device-tree for that master. There's no real reason for this since
> we can discover the number of ports the master supports by looking
> at the port_max field of the status register.
>
> This patch re-works the bus add logic so that we always create buses
> for each port, unless the bus is marked as unavailable in the DT. This
> is useful since it ensures that all the buses provided by the CFAM I2C
> master are accessible to debug tools.
>
> Cc: Eddie James <eajames@linux.vnet.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>   drivers/i2c/busses/i2c-fsi.c | 30 +++++++++++++++++++++++++-----
>   1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 1e2be2219a60..59a76c6e31ad 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -658,13 +658,27 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
>   	.functionality = fsi_i2c_functionality,
>   };
>
> +static device_node *fsi_i2c_find_port_of_node(struct device_node *master,
> +					      int port)
> +{
> +	struct device_node *np;
> +
> +	for_each_child_of_node(fsi, np) {
> +		rc = of_property_read_u32(np, "reg", &port_no);
> +		if (!rc && port_no == port)
> +			return np;
> +	}
> +
> +	return NULL;
> +}
> +
>   static int fsi_i2c_probe(struct device *dev)
>   {
>   	struct fsi_i2c_master *i2c;
>   	struct fsi_i2c_port *port;
>   	struct device_node *np;
> +	u32 port_no, ports, stat;
>   	int rc;
> -	u32 port_no;
>
>   	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>   	if (!i2c)
> @@ -678,10 +692,16 @@ static int fsi_i2c_probe(struct device *dev)
>   	if (rc)
>   		return rc;
>
> -	/* Add adapter for each i2c port of the master. */
> -	for_each_available_child_of_node(dev->of_node, np) {
> -		rc = of_property_read_u32(np, "reg", &port_no);
> -		if (rc || port_no > USHRT_MAX)
> +	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &state);
> +	if (rc)
> +		return rc;
> +
> +	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat);
> +	dev_dbg(dev, "I2C master has %d ports\n", ports);


Thanks for the patch Oliver. This looks great except some older CFAM 
types don't report the max port number, in which case this would not 
probe up any ports. So we probably need a fallback to dts if the max 
ports is 0.


Thanks,

Eddie


> +
> +	for (port_no = 0; port_no < ports; port_no++) {
> +		np = fsi_i2c_find_port_of_node(dev.of_node, port_no);
> +		if (np && !of_device_is_available(np))
>   			continue;
>
>   		port = kzalloc(sizeof(*port), GFP_KERNEL);
