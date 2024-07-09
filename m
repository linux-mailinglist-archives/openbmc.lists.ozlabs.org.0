Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4385D92BD03
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 16:35:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fciBUmLW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJNnp6Qhcz3cXH
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 00:35:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fciBUmLW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJNnH46Tpz2ydQ
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 00:35:15 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469DvnJC024297;
	Tue, 9 Jul 2024 14:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=i
	PbDXvfPgD6q0soddCJjbSeVGFtOhxVtZok3llCgX0k=; b=fciBUmLWBKx0v2puv
	nbMB8FEhppgsndiU7K+5S0vYRFs2klNuGrN3W+prtQI2n3FN5juFajbJl59eN3p7
	l/aMBgMSVKMBYI8rbgt8NDp5ulhrhMXzRWhuAw1LdH9dBHVJO5eSt91fMm8SGJiz
	UzZk8HGWolghbjcyVQpxWxSiFZlqKzr6HBxYGCF+gHVWnEKhbIft2MuaXs2giyO7
	vbNkLCGrHfKuNZsszU9MhkR4acsAjG8Z+uvpS+j5YVE80rmLVN8Nt5s34TaJUrwo
	DUfwgAgnQHMzGPmpmCayxAO/V6b2mRUygkbsvPWQdBsOEp/7+tevcsXD8xF4eBuU
	qvbDQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4092ks8sj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:35:08 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 469CMk3K024575;
	Tue, 9 Jul 2024 14:35:07 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 407hrmmwc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:35:07 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 469EZ4wP38076946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jul 2024 14:35:07 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99C9B58064;
	Tue,  9 Jul 2024 14:35:04 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 450BF58056;
	Tue,  9 Jul 2024 14:35:04 +0000 (GMT)
Received: from [9.61.77.123] (unknown [9.61.77.123])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jul 2024 14:35:04 +0000 (GMT)
Message-ID: <ccae0209-d48d-4c5f-964d-cb384e5fd9e8@linux.ibm.com>
Date: Tue, 9 Jul 2024 09:35:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/60] i2c: fsi: reword according to newest
 specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-16-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20240706112116.24543-16-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hCiKMkG92dDewDjYyLNMlv65ZRknNhOI
X-Proofpoint-ORIG-GUID: hCiKMkG92dDewDjYyLNMlv65ZRknNhOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090093
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
Cc: openbmc@lists.ozlabs.org, Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 7/6/24 06:20, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-fsi.c | 56 ++++++++++++++++++------------------
>   1 file changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 10332693edf0..ae016a9431da 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0+
>   /*
> - * FSI-attached I2C master algorithm
> + * FSI-attached I2C controller algorithm
>    *
>    * Copyright 2018 IBM Corporation
>    *
> @@ -145,7 +145,7 @@
>   /* choose timeout length from legacy driver; it's well tested */
>   #define I2C_ABORT_TIMEOUT	msecs_to_jiffies(100)
>   
> -struct fsi_i2c_master {
> +struct fsi_i2c_ctrl {
>   	struct fsi_device	*fsi;
>   	u8			fifo_size;
>   	struct list_head	ports;
> @@ -155,7 +155,7 @@ struct fsi_i2c_master {
>   struct fsi_i2c_port {
>   	struct list_head	list;
>   	struct i2c_adapter	adapter;
> -	struct fsi_i2c_master	*master;
> +	struct fsi_i2c_ctrl	*ctrl;
>   	u16			port;
>   	u16			xfrd;
>   };
> @@ -183,7 +183,7 @@ static int fsi_i2c_write_reg(struct fsi_device *fsi, unsigned int reg,
>   	return fsi_device_write(fsi, reg, &data_be, sizeof(data_be));
>   }
>   
> -static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
> +static int fsi_i2c_dev_init(struct fsi_i2c_ctrl *i2c)
>   {
>   	int rc;
>   	u32 mode = I2C_MODE_ENHANCED, extended_status, watermark;
> @@ -214,7 +214,7 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
>   static int fsi_i2c_set_port(struct fsi_i2c_port *port)
>   {
>   	int rc;
> -	struct fsi_device *fsi = port->master->fsi;
> +	struct fsi_device *fsi = port->ctrl->fsi;
>   	u32 mode, dummy = 0;
>   
>   	rc = fsi_i2c_read_reg(fsi, I2C_FSI_MODE, &mode);
> @@ -236,7 +236,7 @@ static int fsi_i2c_set_port(struct fsi_i2c_port *port)
>   static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
>   			 bool stop)
>   {
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   	u32 cmd = I2C_CMD_WITH_START | I2C_CMD_WITH_ADDR;
>   
>   	port->xfrd = 0;
> @@ -268,7 +268,7 @@ static int fsi_i2c_write_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
>   {
>   	int write;
>   	int rc;
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   	int bytes_to_write = i2c->fifo_size - fifo_count;
>   	int bytes_remaining = msg->len - port->xfrd;
>   
> @@ -294,7 +294,7 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
>   {
>   	int read;
>   	int rc;
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   	int bytes_to_read;
>   	int xfr_remaining = msg->len - port->xfrd;
>   	u32 dummy;
> @@ -330,7 +330,7 @@ static int fsi_i2c_get_scl(struct i2c_adapter *adap)
>   {
>   	u32 stat = 0;
>   	struct fsi_i2c_port *port = adap->algo_data;
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   
>   	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
>   
> @@ -341,7 +341,7 @@ static void fsi_i2c_set_scl(struct i2c_adapter *adap, int val)
>   {
>   	u32 dummy = 0;
>   	struct fsi_i2c_port *port = adap->algo_data;
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   
>   	if (val)
>   		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> @@ -353,7 +353,7 @@ static int fsi_i2c_get_sda(struct i2c_adapter *adap)
>   {
>   	u32 stat = 0;
>   	struct fsi_i2c_port *port = adap->algo_data;
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   
>   	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
>   
> @@ -364,7 +364,7 @@ static void fsi_i2c_set_sda(struct i2c_adapter *adap, int val)
>   {
>   	u32 dummy = 0;
>   	struct fsi_i2c_port *port = adap->algo_data;
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   
>   	if (val)
>   		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
> @@ -377,7 +377,7 @@ static void fsi_i2c_prepare_recovery(struct i2c_adapter *adap)
>   	int rc;
>   	u32 mode;
>   	struct fsi_i2c_port *port = adap->algo_data;
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   
>   	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>   	if (rc)
> @@ -392,7 +392,7 @@ static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
>   	int rc;
>   	u32 mode;
>   	struct fsi_i2c_port *port = adap->algo_data;
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   
>   	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>   	if (rc)
> @@ -402,7 +402,7 @@ static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
>   	fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>   }
>   
> -static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
> +static int fsi_i2c_reset_bus(struct fsi_i2c_ctrl *i2c,
>   			     struct fsi_i2c_port *port)
>   {
>   	int rc;
> @@ -435,7 +435,7 @@ static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
>   	return fsi_i2c_dev_init(i2c);
>   }
>   
> -static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
> +static int fsi_i2c_reset_engine(struct fsi_i2c_ctrl *i2c, u16 port)
>   {
>   	int rc;
>   	u32 mode, dummy = 0;
> @@ -478,7 +478,7 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
>   	unsigned long start;
>   	u32 cmd = I2C_CMD_WITH_STOP;
>   	u32 stat;
> -	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_i2c_ctrl *i2c = port->ctrl;
>   	struct fsi_device *fsi = i2c->fsi;
>   
>   	rc = fsi_i2c_reset_engine(i2c, port->port);
> @@ -505,7 +505,7 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
>   	if (rc)
>   		return rc;
>   
> -	/* wait until we see command complete in the master */
> +	/* wait until we see command complete in the controller */
>   	start = jiffies;
>   
>   	do {
> @@ -579,7 +579,7 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
>   	unsigned long start = jiffies;
>   
>   	do {
> -		rc = fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT,
> +		rc = fsi_i2c_read_reg(port->ctrl->fsi, I2C_FSI_STAT,
>   				      &status);
>   		if (rc)
>   			return rc;
> @@ -609,10 +609,10 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   	int i, rc;
>   	unsigned long start_time;
>   	struct fsi_i2c_port *port = adap->algo_data;
> -	struct fsi_i2c_master *master = port->master;
> +	struct fsi_i2c_ctrl *ctrl = port->ctrl;
>   	struct i2c_msg *msg;
>   
> -	mutex_lock(&master->lock);
> +	mutex_lock(&ctrl->lock);
>   
>   	rc = fsi_i2c_set_port(port);
>   	if (rc)
> @@ -633,7 +633,7 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   	}
>   
>   unlock:
> -	mutex_unlock(&master->lock);
> +	mutex_unlock(&ctrl->lock);
>   	return rc ? : num;
>   }
>   
> @@ -654,7 +654,7 @@ static struct i2c_bus_recovery_info fsi_i2c_bus_recovery_info = {
>   };
>   
>   static const struct i2c_algorithm fsi_i2c_algorithm = {
> -	.master_xfer = fsi_i2c_xfer,
> +	.xfer = fsi_i2c_xfer,
>   	.functionality = fsi_i2c_functionality,
>   };
>   
> @@ -676,7 +676,7 @@ static struct device_node *fsi_i2c_find_port_of_node(struct device_node *fsi,
>   
>   static int fsi_i2c_probe(struct device *dev)
>   {
> -	struct fsi_i2c_master *i2c;
> +	struct fsi_i2c_ctrl *i2c;
>   	struct fsi_i2c_port *port;
>   	struct device_node *np;
>   	u32 port_no, ports, stat;
> @@ -699,7 +699,7 @@ static int fsi_i2c_probe(struct device *dev)
>   		return rc;
>   
>   	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat) + 1;
> -	dev_dbg(dev, "I2C master has %d ports\n", ports);
> +	dev_dbg(dev, "I2C controller has %d ports\n", ports);
>   
>   	for (port_no = 0; port_no < ports; port_no++) {
>   		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
> @@ -712,7 +712,7 @@ static int fsi_i2c_probe(struct device *dev)
>   			break;
>   		}
>   
> -		port->master = i2c;
> +		port->ctrl = i2c;
>   		port->port = port_no;
>   
>   		port->adapter.owner = THIS_MODULE;
> @@ -742,7 +742,7 @@ static int fsi_i2c_probe(struct device *dev)
>   
>   static int fsi_i2c_remove(struct device *dev)
>   {
> -	struct fsi_i2c_master *i2c = dev_get_drvdata(dev);
> +	struct fsi_i2c_ctrl *i2c = dev_get_drvdata(dev);
>   	struct fsi_i2c_port *port, *tmp;
>   
>   	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
> @@ -772,5 +772,5 @@ static struct fsi_driver fsi_i2c_driver = {
>   module_fsi_driver(fsi_i2c_driver);
>   
>   MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> -MODULE_DESCRIPTION("FSI attached I2C master");
> +MODULE_DESCRIPTION("FSI attached I2C controller");
>   MODULE_LICENSE("GPL");
