Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE751101E
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 01:06:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vYt75bh8zDqNt
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 09:06:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vYs82RvfzDqNT
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 09:05:30 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 16:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,419,1549958400"; d="scan'208";a="153984721"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 01 May 2019 16:05:27 -0700
Subject: Re: pid control configuration
To: openbmc@lists.ozlabs.org
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
Date: Wed, 1 May 2019 16:05:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 5/1/19 3:53 PM, Vijay Khemka wrote:
> Hi Patrick/James,
> 
> I am not understanding how to get these following data for configuration
> file for pid. I only had p(proportional), i(integral) and
> d(differential) values from my thermal team. But unable to maop these to
> required parameter.
> 
>  
> 
>     "required": [
> 
>         "Class",
This will be PIDController in the case of PID, and is part of how entity
manager divides up the config information to the various components.
> 
>         "FFGainCoefficient",
> 
>         "FFOffCoefficient",
In your case, both of these FF variables would be 0.0
> 
>         "ICoefficient",
Would be the I value from your thermal team.

> 
>         "ILimitMax",
> 
>         "ILimitMin",

These sets the limits to the integral coefficient to prevent integral
runaway in the case where the controller cannot ever reach the target
temperature.  If you don't want to use these at all (which I wouldn't
recommend from a control perspective) you can set them to unreasonably
large and unreasonably small values, and they will have no effect.

> 
>         "Inputs",

The sensors you want to control, by name.

> 
>         "Name",
This is the "pretty" name for this controller, and can be whatever you
want.  The controller will show up in DBus and Redfish under this name.

> 
>         "OutLimitMax",
> 
>         "OutLimitMin",
> 

I believe both of these are in % of fan speed these days, so setting
them to 100 and 0% respectively will probably give you the behavior you
want if you don't have other data from your thermal team around limits.

>         "PCoefficient",
Your P value from your thermal team.

> 
>         "SlewNeg",
> 
>         "SlewPos",

These two reflect the D values from your thermal team.  If they only
gave you one D value, there are two things here.  1. It could use the
same coefficients for both positive and negative derivative values.  Or
2. It only applies to Positive slew rates, and negative is zero.  You
would need to talk to your team to understand what they intended.

> 
>         "Type",
The Entity manager type, which I believe it PIDController, but I don't
have the examples in front of me.

> 
>         "Zones"
Fan zones in which this controller applies to.  For Tioga pass I would
expect you to only have a single fan zone for the whole node.

> 
>     ]
> 
>  
> 
>  
> 
> Also we have a requirement of stepwise and pid together for some
> sensors, is it possible to configure same sensor for both types.Yes, you can declare multiple controllers.  Whichever controller
requests the high fan speed will be the one that's used for the PWM output.
