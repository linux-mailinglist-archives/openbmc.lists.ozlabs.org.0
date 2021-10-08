Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C342861B
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 07:06:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSRbm2gT2z2yhd
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 16:06:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vrk69gbb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Vrk69gbb; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQyfp4vfzz3053
 for <openbmc@lists.ozlabs.org>; Sat,  9 Oct 2021 06:19:13 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id z24so5799483qtv.9
 for <openbmc@lists.ozlabs.org>; Fri, 08 Oct 2021 12:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dzA351pjnS7pL1FBPqgBtwcMIqRPM9/An2JZIEmCn84=;
 b=Vrk69gbbdZq70K+ESlJ+kgKyQeKB+ZY0vUkmNNp7PB/SittIUHzrMAR7BnDqpiUP6J
 loFJerFIbeWEoSLiEjNPAOnOKFMRxHqkBeENVwPnzKrUEGkj1If+pzB/kNBfqTtZDZZD
 jqLFRlQFMk/6pJcndkcR5DnaJIszW6gf0+oP6mZojtezJspRls7JqowZfpHqMdr83FNu
 65T5G2el27dpNudoC8bPF2dSKYymhTiCuf9WSV9os5chO756OKGUUp/FuDqIJspP0gge
 LiIe8R6dA5pmCLJjrU2qcrisqnpOG1byGXIDF9+6wCQi1PEIqsU8bNd94uXt1scAi1zr
 ux8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dzA351pjnS7pL1FBPqgBtwcMIqRPM9/An2JZIEmCn84=;
 b=omPEsMNng1WD5Po3NwvdOjQdWHVzmmoDTkQUC+Gfd85wTkY19QMLfUQR9W+Akd0onq
 zE0d3tD+l2ZbljFGvQvaz+KkGuMyPNLU51q0kal7+ohIeZQBrzk5fA3dLphSfIzsOr4Z
 Jaw1nF77p60i663GW4JGHiKbFZZesUlQuurXoHLHOZPGEtVnB2VJd1ksD1LJRZe0iRCi
 lwmDQdCC9PlFYL88AihbSBpcti9powGxJ2FA95Z7xuodfsapWLkLewMF3caS0rL6q9it
 FEQYt5Esh5A91gJdTjuULYDmDaEXCuncCeDRZe8KfgAnycNrxmhhHnwTLRtQGRjRpYWw
 XdIw==
X-Gm-Message-State: AOAM530BMXBvbiadxorqY31/ynanKozhs46XtaTsflvF9P8olIGnr36C
 PjmNZU6lG+zhPZlPkb6ZE0E=
X-Google-Smtp-Source: ABdhPJzHhRVfzmEtnZpeTiZIR469U2aJ3PVvupJRZdEFmGDXTWO5fCW7fjSd4a64UhtTIhQs5SPQRg==
X-Received: by 2002:ac8:42d6:: with SMTP id g22mr144984qtm.17.1633720751242;
 Fri, 08 Oct 2021 12:19:11 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net.
 [67.187.90.124])
 by smtp.gmail.com with ESMTPSA id i11sm224719qki.28.2021.10.08.12.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 12:19:10 -0700 (PDT)
Subject: Re: [PATCH 6/9] of: add support for 'dynamic' DT property
From: Frank Rowand <frowand.list@gmail.com>
To: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <20211007000954.30621-7-zev@bewilderbeest.net>
 <7bf5cfce-e84d-f0e8-e6e8-8e6fedffd154@gmail.com>
Message-ID: <e6803838-6a02-9f67-bd09-35e5cb6aa906@gmail.com>
Date: Fri, 8 Oct 2021 14:19:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7bf5cfce-e84d-f0e8-e6e8-8e6fedffd154@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 11 Oct 2021 16:05:05 +1100
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/8/21 1:51 PM, Frank Rowand wrote:
> On 10/6/21 7:09 PM, Zev Weiss wrote:
>> Nodes marked with this (boolean) property will have a writable status
>> sysfs file, which can be used to toggle them between "okay" and
>> "reserved", effectively hot-plugging them.  Note that this will only
>> be effective for devices on busses that register for OF reconfig
>> notifications (currently spi, i2c, and platform), and only if
>> CONFIG_OF_DYNAMIC is enabled.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  drivers/of/kobj.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 69 insertions(+)
>>
>> diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
>> index 378cb421aae1..141ae23f3130 100644
>> --- a/drivers/of/kobj.c
>> +++ b/drivers/of/kobj.c
>> @@ -36,6 +36,69 @@ static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
>>  	return memory_read_from_buffer(buf, count, &offset, pp->value, pp->length);
>>  }
>>  
>> +static ssize_t of_node_status_write(struct file *filp, struct kobject *kobj,
>> +                                    struct bin_attribute *bin_attr, char *buf,
>> +                                    loff_t offset, size_t count)
>> +{
>> +	int rc;
>> +	char *newstatus;
>> +	struct property **deadprev;
>> +	struct property *newprop = NULL;
>> +	struct property *oldprop = container_of(bin_attr, struct property, attr);
>> +	struct device_node *np = container_of(kobj, struct device_node, kobj);
>> +
>> +	if (WARN_ON_ONCE(strcmp(oldprop->name, "status")))
>> +		return -EIO;
>> +
>> +	if (offset)
>> +		return -EINVAL;
>> +
>> +	if (sysfs_buf_streq(buf, count, "okay") || sysfs_buf_streq(buf, count, "ok"))
>> +		newstatus = "okay";
>> +	else if (sysfs_buf_streq(buf, count, "reserved"))
>> +		newstatus = "reserved";
>> +	else if (sysfs_buf_streq(buf, count, "disabled"))
>> +		newstatus = "disabled";
>> +	else
>> +		return -EINVAL;
>> +
>> +	if (!strcmp(newstatus, oldprop->value))
>> +		return count;
>> +
> 
> If the general approach of this patch set is the correct way to provide the desired
> functionality (I'm still pondering that), then a version of the following code
> probably belongs in drivers/of/dynamic.c so that it is easier to maintain and keep
> consistent with other dynamic devicetree updates.  If you look at the code there
> that touches deadprops (eg __of_changeset_entry_apply()) you will notice that the
> locking issues are more extensive than what is implemented here.
> 
> I'm still thinking about how this interacts with other forms of dynamic devicetree
> changes (eg drivers/of/dynamic.c and also overlays).
> 
>> +	/*
>> +	 * of_update_property_self() doesn't free replaced properties, so
>> +	 * rifle through deadprops first to see if there's an equivalent old
>> +	 * status property we can reuse instead of allocating a new one.
>> +	 */
>> +	mutex_lock(&of_mutex);
>> +	for (deadprev = &np->deadprops; *deadprev; deadprev = &(*deadprev)->next) {
>> +		struct property *deadprop = *deadprev;
>> +		if (!strcmp(deadprop->name, "status") &&
>> +		    deadprop->length == strlen(newstatus) + 1 &&
>> +		    !strcmp(deadprop->value, newstatus)) {
>> +			*deadprev = deadprop->next;
>> +			deadprop->next = NULL;
>> +			newprop = deadprop;
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&of_mutex);
>> +
>> +	if (!newprop) {
>> +		newprop = kzalloc(sizeof(*newprop), GFP_KERNEL);
>> +		if (!newprop)
>> +			return -ENOMEM;
>> +
>> +		newprop->name = oldprop->name;
>> +		newprop->value = newstatus;
>> +		newprop->length = strlen(newstatus) + 1;
>> +	}
>> +
>> +	rc = of_update_property_self(np, newprop, true);
> 
> -Frank
> 
>> +
>> +	return rc ? rc : count;
>> +}
>> +
>>  /* always return newly allocated name, caller must free after use */
>>  static const char *safe_name(struct kobject *kobj, const char *orig_name)
>>  {
>> @@ -79,6 +142,12 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
>>  	pp->attr.size = secure ? 0 : pp->length;
>>  	pp->attr.read = of_node_property_read;
>>  
>> +	if (!strcmp(pp->name, "status") && of_property_read_bool(np, "dynamic")) {
>> +		pp->attr.attr.mode |= 0200;
>> +		pp->attr.write = of_node_status_write;
>> +		pp->attr.growable = true;
>> +	}

This isn't (yet) a request for a change to the patch, but more exposing a
potential issue of interaction with overlays.

The current in tree instances of updating a property value are fairly
limited.  Adding a userspace interface to update a property value
(although limited to only a node's status value) has me thinking about
the interaction with dynamic devicetree updates (of/overlay/dynamic.c)
and also overlays.

If a node exists in a base devicetree, containing only the property
"status", then an overlay subsequently populates the node with a
"dynamic" property then the sysfs status file will not be updated
to be writable.  If we do not allow an overlay to add a property
to an existing node, then not an issue.  But we have not created
such overlay rules yet.

Again, not a request for a change to this patch yet, just leaving
a breadcrumb for myself.

-Frank

>> +
>>  	rc = sysfs_create_bin_file(&np->kobj, &pp->attr);
>>  	WARN(rc, "error adding attribute %s to node %pOF\n", pp->name, np);
>>  	return rc;
>>
> 

