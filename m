Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 230B1264D24
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 20:35:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnSHx3hBzzDqXb
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 04:35:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnSFt2vZ9zDqBZ
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 04:33:52 +1000 (AEST)
IronPort-SDR: 7H0W/csFKTXT6xI+wKGTQQJ71r2AnywKmXXbvVngrvq+4PsYRUVV6BVhEwx6egYMZhVWCFy9q8
 NjsEcXZ/MxZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="157890617"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="157890617"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 11:33:42 -0700
IronPort-SDR: 8NISjgQ5/QxPhF8WI+uLAZm63QV/eJD0mFZHRHBu/0GoDg6cBU8CYbYBYOb78gSpOfMuIYg6Mm
 sadTF8Lwa1Gw==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="300656736"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.251.9.134])
 ([10.251.9.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 11:33:42 -0700
Subject: Re: OpenBMC Learning Series
To: Sai Dasari <sdasari@fb.com>, Openbmc <openbmc@lists.ozlabs.org>
References: <C24D4BAF-B185-4640-BFEF-D391E51A0A35@fb.com>
 <452FDC0B-2E4F-4AD9-97E6-DE9B2333D99B@fb.com>
 <8EE0F70D-78CB-4CDB-A51C-53FC33A2AC87@fb.com>
 <EFFBC9D1-BA53-4C61-8BC2-7F52320245F7@fb.com>
 <51C18C28-4894-4BEF-AAA6-BACE5B934B5C@fb.com>
 <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <675aaf18-40f6-e175-5899-3269c93ca3f5@linux.intel.com>
Date: Thu, 10 Sep 2020 11:33:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 9/9/2020 9:58 AM, Sai Dasari wrote:
> Quick reminder about this week’s two sessions by (Surya and James) as 
> below and also please find attached meeting invites.
> 
> Session#1
> 
> Topic: Remote BIOS Configuration
> 
> Speaker: Suryakanth Sekar
> 
> Time: Sep 10, 2020 10:00 AM India
> 
> Session#2
> 
> Topic: Entity-Manager on S2600WF

dbusViewer script from demo was pushed here as requested 
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/36377 for 
those interested.

> 
> Speaker: James Feist
> 
> Time: Sep 10, 2020 10:00 AM Pacific Time (US and Canada)
> 
> Join Zoom Meeting
> 
> https://us02web.zoom.us/j/9396880476?pwd=a2gyYkVpRjhBZEthQUQzcEF2QjRXUT09
> 
> Meeting ID: 939 688 0476
> 
> Passcode: openbmc
> 
> One tap mobile
> 
> +16699009128,,9396880476#,,,,,,0#,,8592515# US (San Jose)
> 
> +12532158782,,9396880476#,,,,,,0#,,8592515# US (Tacoma)
> 
> Dial by your location
> 
>          +1 669 900 9128 US (San Jose)
> 
>          +1 253 215 8782 US (Tacoma)
> 
>          +1 346 248 7799 US (Houston)
> 
>          +1 301 715 8592 US (Germantown)
> 
>          +1 312 626 6799 US (Chicago)
> 
>          +1 646 558 8656 US (New York)
> 
> Meeting ID: 939 688 0476
> 
> Passcode: 8592515
> 
> Find your local number: https://us02web.zoom.us/u/kddfSpAkEj
> 
> *From: *openbmc <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org> on 
> behalf of Sai Dasari <sdasari@fb.com>
> *Date: *Thursday, September 3, 2020 at 3:17 PM
> *To: *Openbmc <openbmc@lists.ozlabs.org>
> *Subject: *Re: OpenBMC Learning Series
> 
> Thanks to Patrick for a great session on D-Bus usage in OpenBMC stack 
> that including sdbusplus, sdbus++, phosphor-dbus-interfaces.
> 
> For those who could not attend the session, the video/slides are 
> available@ 
> https://github.com/openbmc/openbmc/wiki/Presentations#openbmc-learning-series2020
> 
> -Sai.
> 
> *From: *openbmc <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org> on 
> behalf of Sai Dasari <sdasari@fb.com>
> *Date: *Wednesday, September 2, 2020 at 9:58 AM
> *To: *Openbmc <openbmc@lists.ozlabs.org>
> *Subject: *Re: OpenBMC Learning Series
> 
> Quick reminder about tomorrow’s learning session#3 by Patrick Williams. 
> Please find attached calendar invite and let me know for any additional 
> info.
> 
> ====================================================
> 
> Topic: OpenBMC: sdbusplus and phosphor-dbus-interfaces
> 
> Time: Sep 3, 2020 10:00 AM Pacific Time (US and Canada)
> 
> Join Zoom Meeting
> 
> https://us02web.zoom.us/j/9396880476?pwd=a2gyYkVpRjhBZEthQUQzcEF2QjRXUT09
> 
> Meeting ID: 939 688 0476
> 
> Passcode: openbmc
> 
> One tap mobile
> 
> +16699009128,,9396880476#,,,,,,0#,,8592515# US (San Jose)
> 
> +12532158782,,9396880476#,,,,,,0#,,8592515# US (Tacoma)
> 
> Dial by your location
> 
>          +1 669 900 9128 US (San Jose)
> 
>          +1 253 215 8782 US (Tacoma)
> 
>          +1 346 248 7799 US (Houston)
> 
>          +1 301 715 8592 US (Germantown)
> 
>          +1 312 626 6799 US (Chicago)
> 
>          +1 646 558 8656 US (New York)
> 
> Meeting ID: 939 688 0476
> 
> Passcode: 8592515
> 
> Find your local number: https://us02web.zoom.us/u/kddfSpAkEj
> 
> *From: *openbmc <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org> on 
> behalf of Sai Dasari <sdasari@fb.com>
> *Date: *Wednesday, August 26, 2020 at 12:12 PM
> *To: *Openbmc <openbmc@lists.ozlabs.org>
> *Subject: *Re: OpenBMC Learning Series
> 
> Quick reminder about tomorrow’s learning session#2. Please find attached 
> calendar invite and let me know for any additional info.
> 
> ==========================================================
> 
> Topic: OpenBMC: Adding New Machine
> 
> Time: Aug 27, 2020 10:00 AM Pacific Time (US and Canada)
> 
> Join Zoom Meeting
> 
> https://us02web.zoom.us/j/9396880476?pwd=a2gyYkVpRjhBZEthQUQzcEF2QjRXUT09
> 
> Meeting ID: 939 688 0476
> 
> Passcode: openbmc
> 
> One tap mobile
> 
> +16699009128,,9396880476#,,,,,,0#,,8592515# US (San Jose)
> 
> +12532158782,,9396880476#,,,,,,0#,,8592515# US (Tacoma)
> 
> Dial by your location
> 
>          +1 669 900 9128 US (San Jose)
> 
>          +1 253 215 8782 US (Tacoma)
> 
>          +1 346 248 7799 US (Houston)
> 
>          +1 301 715 8592 US (Germantown)
> 
>          +1 312 626 6799 US (Chicago)
> 
>          +1 646 558 8656 US (New York)
> 
> Meeting ID: 939 688 0476
> 
> Passcode: 8592515
> 
> Find your local number: https://us02web.zoom.us/u/kddfSpAkEj
> 
> *From: *openbmc <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org> on 
> behalf of Sai Dasari <sdasari@fb.com>
> *Date: *Friday, August 21, 2020 at 10:49 PM
> *To: *Openbmc <openbmc@lists.ozlabs.org>
> *Subject: *Re: OpenBMC Learning Series
> 
> Thanks to Richard for presenting a great first session on User Management.
> 
> For those of you who could not make it, the slides (updated version 
> after Q&A) are available@ 
> https://drive.google.com/file/d/1aFXaZbYNkALgzmH9MYEn1-97oZAW8rqM/view?usp=sharing 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__drive.google.com_file_d_1aFXaZbYNkALgzmH9MYEn1-2D97oZAW8rqM_view-3Fusp-3Dsharing&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=W2PdyBpoSN7rpl8z6_uS891JY-SIQrSEdBri02QvbbI&s=xMT9e6yvB0vbyE0qzXgvB7S93EjlBrDKKOxUiieG14Q&e=>. 
> And the video recording is available@ 
> https://www.youtube.com/watch?v=19s-JwLBhTY.
> 
> This information is also updated on our Github’s wiki page for for new 
> people joining our community@ 
> https://github.com/openbmc/openbmc/wiki/Presentations#openbmc-learning-series2020.
> 
> -Sai.
> 
> *From: *openbmc <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org> on 
> behalf of Sai Dasari <sdasari@fb.com>
> *Date: *Wednesday, August 19, 2020 at 10:47 AM
> *To: *Openbmc <openbmc@lists.ozlabs.org>
> *Subject: *Re: OpenBMC Learning Series
> 
> Quick reminder for tomorrow’s first session in this series: 8/20@10AM PDT.
> 
> Thanks to Richard for kicking us off to this series with OpenBMC User 
> Management topic.
> 
> Details of the session as follows and please let me know for any 
> additional info.
> 
> Thanks,
> 
> Sai.
> 
> ==================================
> 
> Topic: OpenBMC: User Management
> 
> Time: Aug 20, 2020 10:00 AM Pacific Time (US and Canada)
> 
> Join Zoom Meeting
> 
> https://us02web.zoom.us/j/9396880476?pwd=a2gyYkVpRjhBZEthQUQzcEF2QjRXUT09
> 
> Meeting ID: 939 688 0476
> 
> Passcode: openbmc
> 
> One tap mobile
> 
> +16699009128,,9396880476#,,,,,,0#,,8592515# US (San Jose)
> 
> +12532158782,,9396880476#,,,,,,0#,,8592515# US (Tacoma)
> 
> Dial by your location
> 
>          +1 669 900 9128 US (San Jose)
> 
>          +1 253 215 8782 US (Tacoma)
> 
>          +1 346 248 7799 US (Houston)
> 
>          +1 301 715 8592 US (Germantown)
> 
>          +1 312 626 6799 US (Chicago)
> 
>          +1 646 558 8656 US (New York)
> 
> Meeting ID: 939 688 0476
> 
> Passcode: 8592515
> 
> Find your local number: https://us02web.zoom.us/u/kddfSpAkEj
> 
> *From: *Sai Dasari <sdasari@fb.com>
> *Date: *Friday, July 24, 2020 at 5:13 PM
> *To: *Openbmc <openbmc@lists.ozlabs.org>
> *Subject: *Re: [Potential Spoof] OpenBMC Learning Series
> 
> Team,
> 
> Thanks to all volunteer speakers stepping up to share their expertise 
> with community. For speaker convenience, the sessions will be held on 
> two *TimeZones* (USA/PDT and INDIA/IST) on *Thursdays@10AM* starting 
> from 8/20 onwards.
> 
> I encourage you to take a look at the shared doc @ 
> https://docs.google.com/spreadsheets/d/1RRO5cgutKE7zRPcjcFjrNn-GI5AYoW0FivEZJe_EyWs/edit?usp=sharing 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.google.com_spreadsheets_d_1RRO5cgutKE7zRPcjcFjrNn-2DGI5AYoW0FivEZJe-5FEyWs_edit-3Fusp-3Dsharing&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=2SO2t6dAiRgpoEypMIDo1ueSAj0rZVW5RVSHRm6oERM&e=> 
> for more information regarding this series. If you would like to see 
> more topics (either as speakers or new community members), please feel 
> free to add them for extending the topics in future sessions.
> 
> Following table is for a quick reference (Apologies for those using text 
> based email clients if the following table does not render properly). 
> The same  information is available at the above shared doc.
> 
> And also please find the calendar appointment for the scheduled sessions 
> as attachments to reserve/plan your time.
> 
> Thanks,
> 
> Sai
> 
> *Session#*
> 
> 	
> 
> *Title*
> 
> 	
> 
> *Speaker*
> 
> 	
> 
> *Meeting Info (password: openbmc) *
> 
> 1
> 
> 	
> 
> OpenBMC User Management
> 
> 	
> 
> Richard Thomaiyar
> 
> 	
> 
> _https://us02web.zoom.us/j/81386216701?pwd=aU1Sd1lrclNqN05aREtzcmFMTG1Kdz09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_81386216701-3Fpwd-3DaU1Sd1lrclNqN05aREtzcmFMTG1Kdz09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=9AThBCEqdfvospiTQZKl0ESRsblacGvTf6NXcIPg7BY&e=>__Date: 
> 8/20@10AM PDT_
> 
> 2
> 
> 	
> 
> Adding new platform to OpenBMC
> 
> 	
> 
> Vijay Khemka
> 
> 	
> 
> _https://us02web.zoom.us/j/84964981135?pwd=UFY3cVRCdHpHVmpUSXNtdjBjZ2pQUT09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_84964981135-3Fpwd-3DUFY3cVRCdHpHVmpUSXNtdjBjZ2pQUT09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=wDCnLmZs7jTsp0QkzqgtyWjwjHiCmEUQiwZ6EI09YQ4&e=>_Date: 
> 8/27@10AM PDT
> 
> 3
> 
> 	
> 
> Redfish EventService
> 
> 	
> 
> AppaRao
> 
> 	
> 
> _https://us02web.zoom.us/j/83980904008?pwd=eDRlMTZpUm56TkpNaWxac2h1czdhUT09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_83980904008-3Fpwd-3DeDRlMTZpUm56TkpNaWxac2h1czdhUT09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=dMWZb-x2QsHTy33ISYwbv3vE7BiBGz6Q7htrMjXXfLY&e=>_Dte: 
> 8/27@10AM *IST*
> 
> 4
> 
> 	
> 
> sdbusplus and phosphor-dbus-interfaces
> 
> 	
> 
> Patrick Williams
> 
> 	
> 
> _https://us02web.zoom.us/j/86726018083?pwd=a1FqeUNEcHhud25WKzJORzdZQ0tsUT09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_86726018083-3Fpwd-3Da1FqeUNEcHhud25WKzJORzdZQ0tsUT09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=x0bEM3ccT9vyMxAlHUTK87pxIBAAUAk3L4j4sbujLto&e=>_Date: 
> 9/3@10AM PDT
> 
> 5
> 
> 	
> 
> Entity Manager on S2600WF
> 
> 	
> 
> James Feist
> 
> 	
> 
> _https://us02web.zoom.us/j/82785505636?pwd=U3N3eWVOYkdhdVFod1FFeVRiQTA3UT09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_82785505636-3Fpwd-3DU3N3eWVOYkdhdVFod1FFeVRiQTA3UT09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=WG5vjI1L9ljwIVx5lgGTexhFanGdAuYmDTZroYshfOU&e=>_Date: 
> 9/10@10AM PDT
> 
> 6
> 
> 	
> 
> Remote BIOS configuration
> 
> 	
> 
> Suryakanth Sekar
> 
> 	
> 
> _https://us02web.zoom.us/j/82943666703?pwd=UjRURnZJc01RSFJLa3RHb2ZycDR1QT09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_82943666703-3Fpwd-3DUjRURnZJc01RSFJLa3RHb2ZycDR1QT09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=I2rlQIzUfoN-sTKq08LGt1_qjDs1zf5MapQWkL4cggM&e=>_Date: 
> 9/10@10AM *IST*
> 
> 7
> 
> 	
> 
> PLDM Modelling for Add-on card
> 
> 	
> 
> Richard Thomaiyar
> 
> 	
> 
> _https://us02web.zoom.us/j/87446140838?pwd=ZVdZOFlCdzU2RlpLaVFVUG1pUUFBZz09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_87446140838-3Fpwd-3DZVdZOFlCdzU2RlpLaVFVUG1pUUFBZz09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=kJZ_Q4L4mURsP2TgnURRRh0tiqu9o7WVbCAGYg_eDVU&e=>_Date: 
> 9/17@10AM PDT
> 
> 8
> 
> 	
> 
> SPDM
> 
> 	
> 
> Vikram Bodireddy
> 
> 	
> 
> _https://us02web.zoom.us/j/82356547887?pwd=NmpOUmNzKzJyTzFWck5yZTJySGs2dz09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_82356547887-3Fpwd-3DNmpOUmNzKzJyTzFWck5yZTJySGs2dz09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=hNn9WH_Jc1Hq1Be8Rg7gFfDJJ52Z0WyrRVaDCCdy3v4&e=>_Date: 
> 9/17@10AM *IST*
> 
> 9
> 
> 	
> 
> PLDM Stack on OpenBMC
> 
> 	
> 
> Deepak Kodihalli
> 
> 	
> 
> _https://us02web.zoom.us/j/81854376605?pwd=R25UMkd6VTNMU2dnOU1HS0Z4NUJ6dz09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_81854376605-3Fpwd-3DR25UMkd6VTNMU2dnOU1HS0Z4NUJ6dz09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=ZoZfwH6dbieWn80ASroVe3aMxCvsFl8DfuoOz6T4pnI&e=>__Date: 
> 9/24@10AM PDT_
> 
> 10
> 
> 	
> 
> OpenBMC's Redfish implementation
> 
> 	
> 
> Gunnar Mills
> 
> 	
> 
> _https://us02web.zoom.us/j/83152526283?pwd=c1g2d1BzbWgvVVVaRU53S2VzT2Vjdz09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_83152526283-3Fpwd-3Dc1g2d1BzbWgvVVVaRU53S2VzT2Vjdz09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=oyQQ2Xm-FiljwaBshOgFZtrTksDUmVIkbVHRD8O-jso&e=>_Date: 
> 10/1@10AM PDT
> 
> 11
> 
> 	
> 
> OpenBMC Vue GUI/ Vue development
> 
> 	
> 
> Dixsie Wolmers
> 
> 	
> 
> _https://us02web.zoom.us/j/87423100421?pwd=YzNCaWlKd3lqN24zUmtsUXcvQmFHdz09
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__us02web.zoom.us_j_87423100421-3Fpwd-3DYzNCaWlKd3lqN24zUmtsUXcvQmFHdz09&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=2a65XM6fGwHmM2fThXUWEF6NG897Y6RZjgFahFaU9uk&s=J47ANxsRgaKd4-ov4eCeJ7bI-P8RQKY0YMFcajPtmSc&e=>_Date: 
> 10/8@10AM PDT
> 
> 12
> 
> 	
> 
> Qemu for OpenBMC development and testing
> 
> 	
> 
> Joel Stanley
> 
> 	
> 
> To Be Scheduled
> 
> 13
> 
> 	
> 
> IPMI subsystem
> 
> 	
> 
> Saravanan Palanisamy
> 
> 	
> 
> To Be Scheduled
> 
> *From: *openbmc <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org> on 
> behalf of Sai Dasari <sdasari@fb.com>
> *Date: *Wednesday, June 3, 2020 at 11:11 AM
> *To: *Openbmc <openbmc@lists.ozlabs.org>
> *Subject: *[Potential Spoof] OpenBMC Learning Series
> 
> Team,
> 
> Our OpenBMC community continues to grow at rapid pace as can be observed 
> by various metrics like number of CCLAs, industry adoption rate, 
> design/code contributions, numerous technical conversations over Mailing 
> List/IRC/Gerritt, and more. Because of this rapid growth the project 
> might appear to be a bit complex for a new contributor evaluating our 
> stack. I believe there are multiple ongoing efforts of reducing this 
> barrier for a potential contributor to ramp them up quickly on this 
> stack that includes documentation, wiki pages, tutorials in our github repo.
> 
> In addition to these ongoing efforts, I propose to start a video based 
> learning series that aims to introduce OpenBMC stack for a potential 
> contributor.  I hope such video series will help disseminate tribal 
> knowledge that we built in this community over a period of time and ramp 
> up the new contributors quickly. To make this series useful, I seek 
> volunteer speakers who are interesting in sharing their expertise and 
> help plan this series to be more effective. For those of you who are 
> interested, please add yourself as speaker with title/description before 
> 6/17 @ 
> https://docs.google.com/spreadsheets/d/1RRO5cgutKE7zRPcjcFjrNn-GI5AYoW0FivEZJe_EyWs/edit?usp=sharing 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.google.com_spreadsheets_d_1RRO5cgutKE7zRPcjcFjrNn-2DGI5AYoW0FivEZJe-5FEyWs_edit-3Fusp-3Dsharing&d=DwMGaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=D804Bb_g8FkIaCjjb_rg7A&m=jiieokO0uAODRnnQ20XixFHfnFjjOHrRUFA1TPRE9SQ&s=7CaN4ZLtu3M2jAphmv6hTsbPxuPeZnbEDkcY2AiHc08&e=>
> 
> Some topics for consideration include OpenBMC project overview, Software 
> stack architecture, community developer guidelines, Repo structure and 
> guidelines, Usage of Yocto in OpenBMC,  Usage of D-Bus in OpenBMC, C++ 
> coding standards in OpenBMC,  IPMI sub-system, Redfish sub-system, Using 
> QEMU effectively, Sensor sub-system, Best practices in debugging, 
> Logging, metrics/telemetry etc. And this is not an exhaustive list and 
> feel free to add any topic that you plan to share with community.
> 
> I will reach out to volunteer speakers and facilitate logistics and 
> update the ML with next steps. Please let me know for any info regarding 
> this effort.
> 
> Thanks,
> Sai.
> 
