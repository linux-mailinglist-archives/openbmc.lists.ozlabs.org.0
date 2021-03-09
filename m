Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B22D332FCB
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 21:21:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw67F2HPtz3cTk
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 07:21:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=bnpny13M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=bnpny13M; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw6702YHpz2xb9
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 07:21:32 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3624041292;
 Tue,  9 Mar 2021 20:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1615321285; x=1617135686; bh=o11Timh0lD1tJz0LaVgGoA+/Y
 GvCMt9fkMLEN704+AI=; b=bnpny13Mjj/0McU3GnMA9dTObsiBJXXHLfwzQIgtm
 JFcQEzsqa61ZTJsR4NX2c3nu341Xn0099M119L5AkJlj9F3BHTGjIn3GOCpBeOzp
 lDisHLJUrQnd1XDjnwFNVveYy6E2XfzuLzW3clrjn6hqVi5A6X3yUkaWUvTMcO/G
 fs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DsBilrI96Is; Tue,  9 Mar 2021 23:21:25 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7C9A24127C;
 Tue,  9 Mar 2021 23:21:25 +0300 (MSK)
Received: from [10.199.0.46] (10.199.0.46) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Mar
 2021 23:21:25 +0300
Message-ID: <ee1c9f78d721fd52d62087674ee282d73e7237de.camel@yadro.com>
Subject: Re: [PATCH linux dev-5.10 33/35] pmbus: (core) Add a one-shot retry
 in pmbus_set_page()
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Eddie James <eajames@linux.ibm.com>, <openbmc@lists.ozlabs.org>
Date: Tue, 9 Mar 2021 23:21:23 +0300
In-Reply-To: <20210308225419.46530-34-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-34-eajames@linux.ibm.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.46]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

Hi,
I have a similar patch in our local tree, but it adds retry in more
places. I had to add retries for all i2c_smbus_* operations because pf
communication to PSUs sometime very unstable.
Here is it:

From 7688b90c3e7e4986535a194a271509095534c3e7 Mon Sep 17 00:00:00 2001
From: Andrei Kartashev <a.kartashev@yadro.com>
Date: Tue, 9 Mar 2021 21:47:25 +0300
Subject: [PATCH] hwmon: (pmbus) Retry I2C request on failure

In real world I2C communication errors are possible. It was discovered
that pmbus read operation for some PSUs occasionally fails in random
places. For pmbus_set_page call there is already retry implemented, but
seems it is not enough.

Add retries for every i2c_smbus_read/i2c_smbus_write call to increase
robust.

Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 65 +++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 60ea917936a7..d98b52950022 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -27,6 +27,7 @@
  */
 #define PMBUS_ATTR_ALLOC_SIZE	32
 #define PMBUS_NAME_SIZE		24
+#define I2C_RETRIES 3
 
 struct pmbus_sensor {
 	struct pmbus_sensor *next;
@@ -144,7 +145,7 @@ EXPORT_SYMBOL_GPL(pmbus_clear_cache);
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	int rv;
+	int rv, rtr;
 
 	if (page < 0)
 		return 0;
@@ -154,18 +155,12 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		dev_dbg(&client->dev, "Want page %u, %u cached\n", page,
 			data->currpage);
 
-		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		if (rv < 0) {
+		for (rtr = 0, rv = -1; (rtr < I2C_RETRIES) && (rv < 0); rtr++)
 			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
 						       page);
-			dev_dbg(&client->dev,
-				"Failed to set page %u, performed one-shot retry %s: %d\n",
-				page, rv ? "and failed" : "with success", rv);
-			if (rv < 0)
-				return rv;
-		}
 
-		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
+		for (rtr = 0, rv = -1; (rtr < I2C_RETRIES) && (rv < 0); rtr++)
+			rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
 		if (rv < 0)
 			return rv;
 
@@ -176,8 +171,9 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (data->info->phases[page] && data->currphase != phase &&
 	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
-		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
-					       phase);
+		for (rtr = 0, rv = -1; (rtr < I2C_RETRIES) && (rv < 0); rtr++)
+			rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
+						       phase);
 		if (rv)
 			return rv;
 	}
@@ -189,13 +185,15 @@ EXPORT_SYMBOL_GPL(pmbus_set_page);
 
 int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 {
-	int rv;
+	int rv, rtr;
 
 	rv = pmbus_set_page(client, page, 0xff);
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_write_byte(client, value);
+	for (rtr = 0, rv = -1; (rtr < I2C_RETRIES) && (rv < 0); rtr++)
+		rv = i2c_smbus_write_byte(client, value);
+	return rv;
 }
 EXPORT_SYMBOL_GPL(pmbus_write_byte);
 
@@ -220,13 +218,15 @@ static int _pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 			  u16 word)
 {
-	int rv;
+	int rv, rtr;
 
 	rv = pmbus_set_page(client, page, 0xff);
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_write_word_data(client, reg, word);
+	for (rtr = 0, rv = -1; (rtr < I2C_RETRIES) && (rv < 0); rtr++)
+		rv = i2c_smbus_write_word_data(client, reg, word);
+	return rv;
 }
 EXPORT_SYMBOL_GPL(pmbus_write_word_data);
 
@@ -302,13 +302,15 @@ EXPORT_SYMBOL_GPL(pmbus_update_fan);
 
 int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 {
-	int rv;
+	int rv, rtr;
 
 	rv = pmbus_set_page(client, page, phase);
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_read_word_data(client, reg);
+	for (rtr = 0, rv = -1; (rtr < I2C_RETRIES) && (rv < 0); rtr++)
+		rv = i2c_smbus_read_word_data(client, reg);
+	return rv;
 }
 EXPORT_SYMBOL_GPL(pmbus_read_word_data);
 
@@ -361,25 +363,29 @@ static int __pmbus_read_word_data(struct i2c_client *client, int page, int reg)
 
 int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 {
-	int rv;
+	int rv, rtr;
 
 	rv = pmbus_set_page(client, page, 0xff);
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_read_byte_data(client, reg);
+	for (rtr = 0, rv = -1; (rtr < I2C_RETRIES) && (rv < 0); rtr++)
+		rv = i2c_smbus_read_byte_data(client, reg);
+	return rv;
 }
 EXPORT_SYMBOL_GPL(pmbus_read_byte_data);
 
 int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 {
-	int rv;
+	int rv, rtr;
 
 	rv = pmbus_set_page(client, page, 0xff);
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_write_byte_data(client, reg, value);
+	for (rtr = 0, rv = -1; (rtr < I2C_RETRIES) && (rv < 0); rtr++)
+		rv = i2c_smbus_write_byte_data(client, reg, value);
+	return rv;
 }
 EXPORT_SYMBOL_GPL(pmbus_write_byte_data);
 
@@ -2193,7 +2199,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			     struct pmbus_driver_info *info)
 {
 	struct device *dev = &client->dev;
-	int page, ret;
+	int page, ret, rtr;
 
 	/*
 	 * Some PMBus chips don't support PMBUS_STATUS_WORD, so try
@@ -2201,10 +2207,13 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * Bail out if both registers are not supported.
 	 */
 	data->read_status = pmbus_read_status_word;
-	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
+	for (rtr = 0, ret = -1; (rtr < I2C_RETRIES) && (ret < 0); rtr++)
+		ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
 	if (ret < 0 || ret == 0xffff) {
 		data->read_status = pmbus_read_status_byte;
-		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
+		for (rtr = 0, ret = -1; (rtr < I2C_RETRIES) && (ret < 0); rtr++)
+			ret = i2c_smbus_read_byte_data(client,
+						       PMBUS_STATUS_BYTE);
 		if (ret < 0 || ret == 0xff) {
 			dev_err(dev, "PMBus status register not found\n");
 			return -ENODEV;
@@ -2214,7 +2223,8 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	}
 
 	/* Enable PEC if the controller supports it */
-	ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
+	for (rtr = 0, ret = -1; (rtr < I2C_RETRIES) && (ret < 0); rtr++)
+		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
 	if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
 		client->flags |= I2C_CLIENT_PEC;
 
@@ -2223,7 +2233,8 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * faults, and we should not try it. Also, in that case, writes into
 	 * limit registers need to be disabled.
 	 */
-	ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
+	for (rtr = 0, ret = -1; (rtr < I2C_RETRIES) && (ret < 0); rtr++)
+		ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
 	if (ret > 0 && (ret & PB_WP_ANY))
 		data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
 
-- 
2.26.2




On Mon, 2021-03-08 at 16:54 -0600, Eddie James wrote:
> From: Andrew Jeffery <andrew@aj.id.au>
> 
> From extensive testing and tracing it was discovered that the
> MAX31785
> occasionally fails to switch pages despite ACK'ing the PAGE PMBus
> data
> write. I suspect this behaviour had been seen on other devices as
> well,
> as pmbus_set_page() already read-back the freshly set value and
> errored
> out if it wasn't what we requested.
> 
> In the case of the MAX31785 it was shown that a one-shot retry was
> enough to get the PAGE write to stick if the inital command failed.
> To
> improve robustness, only error out if the one-shot retry also fails
> to
> stick.
> 
> OpenBMC-Staging-Count: 1
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 31 ++++++++++++++++++++--------
> ---
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c
> b/drivers/hwmon/pmbus/pmbus_core.c
> index 44c1a0a07509..dd4a09d18730 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -151,25 +151,34 @@ int pmbus_set_page(struct i2c_client *client,
> int page, int phase)
>  
>  	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
>  	    data->info->pages > 1 && page != data->currpage) {
> +		int i;
> +
>  		dev_dbg(&client->dev, "Want page %u, %u cached\n",
> page,
>  			data->currpage);
>  
> -		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
> page);
> -		if (rv < 0) {
> +		for (i = 0; i < 2; i++) {
>  			rv = i2c_smbus_write_byte_data(client,
> PMBUS_PAGE,
>  						       page);
> -			dev_dbg(&client->dev,
> -				"Failed to set page %u, performed one-
> shot retry %s: %d\n",
> -				page, rv ? "and failed" : "with
> success", rv);
> +			if (rv)
> +				continue;
> +
> +			rv = i2c_smbus_read_byte_data(client,
> PMBUS_PAGE);
>  			if (rv < 0)
> -				return rv;
> -		}
> +				continue;
>  
> -		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> -		if (rv < 0)
> -			return rv;
> +			/* Success, exit loop */
> +			if (rv == page)
> +				break;
> +
> +			rv = i2c_smbus_read_byte_data(client,
> PMBUS_STATUS_CML);
> +			if (rv < 0)
> +				continue;
> +
> +			if (rv & PB_CML_FAULT_INVALID_DATA)
> +				return -EIO;
> +		}
>  
> -		if (rv != page)
> +		if (i == 2)
>  			return -EIO;
>  	}
>  	data->currpage = page;
-- 
Best regards,
Andrei Kartashev


