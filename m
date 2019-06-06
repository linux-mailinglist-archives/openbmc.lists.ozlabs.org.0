Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0837FBA
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 23:39:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KfDw0kNkzDqFK
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 07:39:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KfDJ11m4zDqmK
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jun 2019 07:38:39 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x56LWP4W074594
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jun 2019 17:38:34 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2syatpr80b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2019 17:38:34 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Thu, 6 Jun 2019 22:38:34 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 22:38:31 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x56LcUEJ30015918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 21:38:30 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 827D0124052;
 Thu,  6 Jun 2019 21:38:30 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32BD3124055;
 Thu,  6 Jun 2019 21:38:30 +0000 (GMT)
Received: from [9.85.223.174] (unknown [9.85.223.174])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jun 2019 21:38:30 +0000 (GMT)
Subject: Re: [PATCH v2] i2c: fsi: Create busses for all ports
To: "Oliver O'Halloran" <oohall@gmail.com>, openbmc@lists.ozlabs.org
References: <20190606115220.9888-1-oohall@gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Thu, 6 Jun 2019 16:38:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606115220.9888-1-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19060621-2213-0000-0000-0000039B2FDC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011225; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214230; UDB=6.00638252; IPR=6.00995310; 
 MB=3.00027212; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-06 21:38:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060621-2214-0000-0000-00005EBF5E11
Message-Id: <5eca0a3d-f2e9-16a9-a9ed-edf795c529a8@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060145
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
Cc: Eddie James <eajames@linux.vnet.ibm.com>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 6/6/19 6:52 AM, Oliver O'Halloran wrote:
> Currently we only create an I2C bus for the ports listed in the
> device-tree for that master. There's no real reason for this since
> we can discover the number of ports the master supports by looking
> at the port_max field of the status register.
>
> This patch re-works the bus add logic so that we always create buses
> for each port, unless the bus is marked as unavailable in the DT. This
> is useful since it ensures that all the buses provided by the CFAM I2C
> master are accessible to debug tools.


Thanks Oliver.

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Cc: Eddie James <eajames@linux.vnet.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> v2: Fixed off-by-one when calulating the number of ports.
>      Compile fixes.
> ---
>   drivers/i2c/busses/i2c-fsi.c | 32 +++++++++++++++++++++++++++-----
>   1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 1e2be2219a60..da5eb3960def 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -658,13 +658,29 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
>   	.functionality = fsi_i2c_functionality,
>   };
>   
> +static struct device_node *fsi_i2c_find_port_of_node(struct device_node *fsi,
> +						     int port)
> +{
> +	struct device_node *np;
> +	u32 port_no;
> +	int rc;
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
> @@ -678,10 +694,16 @@ static int fsi_i2c_probe(struct device *dev)
>   	if (rc)
>   		return rc;
>   
> -	/* Add adapter for each i2c port of the master. */
> -	for_each_available_child_of_node(dev->of_node, np) {
> -		rc = of_property_read_u32(np, "reg", &port_no);
> -		if (rc || port_no > USHRT_MAX)
> +	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
> +	if (rc)
> +		return rc;
> +
> +	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat) + 1;
> +	dev_dbg(dev, "I2C master has %d ports\n", ports);
> +
> +	for (port_no = 0; port_no < ports; port_no++) {
> +		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
> +		if (np && !of_device_is_available(np))
>   			continue;
>   
>   		port = kzalloc(sizeof(*port), GFP_KERNEL);

