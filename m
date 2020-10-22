Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 242172961E9
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 17:52:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHBgl1scszDqtt
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 02:52:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kpWQfr4K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHBfw14CJzDqgs
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 02:51:19 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09MFWeVg058993; Thu, 22 Oct 2020 11:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/ESUtf9Ag3zYVq9lknQ07ZS4oq8A/DTDJ5kXyB4R61M=;
 b=kpWQfr4KHODbJkzxnZ1ovAjXtr1/4Z/kwdDwHNP5S3mrqYfehmqXH6XTT4SC70SxFBYQ
 yCYaOFVStsYNHqd/dLmdF+wqYpB3gjavhCMaaEbFueB9G5hrcJWPwkeLI8xh6HxoJFXG
 KdCFCdLpv+bpfjMIs4E1r62ZiaKLUBVptp0/Hem77lwn+AEIrLPhSShqwLw75tVHI+Si
 5xRbGq62wEHLMNlbOxmkf4nZP3wBgs7nVdKMJzPp2IjpYJpO7mkUxupRatKPEP9UWCds
 kvpNh6NB024D46ciL+2Azf2cFlcQPGgB4WQdZUkDlZYAUu5j9APitzN1FweXX87unmLT NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34b73r3k5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 11:51:14 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09MFZkPm071403;
 Thu, 22 Oct 2020 11:51:14 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34b73r3k51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 11:51:14 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09MFm9Y7002477;
 Thu, 22 Oct 2020 15:51:13 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 347r89unmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 15:51:13 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09MFpDKS34079064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 15:51:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03E9A28058;
 Thu, 22 Oct 2020 15:51:13 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8115328059;
 Thu, 22 Oct 2020 15:51:12 +0000 (GMT)
Received: from [9.160.45.230] (unknown [9.160.45.230])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Oct 2020 15:51:12 +0000 (GMT)
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Thu Ba Nguyen <tbnguyen1985@gmail.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
 <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
 <90950FB3-E1B3-4ACE-97C5-CB9582A94456@fb.com>
 <CALioo37b-BjgUdfZz2Vm+=6K6VMYRO9auyuHHo7=AZBFpoBzdw@mail.gmail.com>
 <CALioo37LBToJaMs9Zt4q4WcMYKT_rF9zG1ujxv3q8HOQvsE8-w@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <26b02688-a8c8-3fb3-6cc9-50daabf4d01e@linux.ibm.com>
Date: Thu, 22 Oct 2020 10:51:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CALioo37LBToJaMs9Zt4q4WcMYKT_rF9zG1ujxv3q8HOQvsE8-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_10:2020-10-20,
 2020-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220103
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/22/2020 9:49 AM, Thu Ba Nguyen wrote:
> I started on supporting enable/disable host sensors. Everythings is 
> fine until I...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> I started on supporting enable/disable host sensors.
> Everythings is fine until I add code to monitor host status as below.
> bool MainLoop::isHostOn(void)
> {
> char buff[128];
> if (!powerMatch)
> {
> log<level::ERR>("Power Match Not Created");
> }
> sprintf(buff, "isHostOn powerStatusOn: %d\n",powerStatusOn);
> log<level::INFO>(buff);
> return powerStatusOn;
> }
> std::shared_ptr<sdbusplus::bus::match::match>
> MainLoop::startHostStateMonitor(void) {
> return std::make_shared<sdbusplus::bus::match::match>(
> *conn,
> "type='signal',interface='org.freedesktop.DBus.Properties',"
> "member='PropertiesChanged',arg0='xyz.openbmc_project.State.Host'",
> [](sdbusplus::message::message &msg) {
> std::string interfaceName;
> boost::container::flat_map<std::string, std::variant<std::string>>
> propertiesChanged;
> try {
> msg.read(interfaceName, propertiesChanged);
> } catch (std::exception &e) {
> log<level::ERR>("Unable to read host state\n");
> return;
> }
> // We only want to check for CurrentHostState
> if (propertiesChanged.begin()->first != "CurrentHostState") {
> return;
> }
> auto findState = propertiesChanged.find(powProperty);
> if (findState != propertiesChanged.end())
> {
> powerStatusOn = boost::ends_with(
> std::get<std::string>(findState->second), "Running");
> }
> powerMatch = true;
> });
> }
> void MainLoop::read()
> {
> // TODO: Issue#3 - Need to make calls to the dbus sensor cache here to
> // ensure the objects all exist?
> /* Host changed state from On to Off */
> if (!isHostOn() && (lastPowerState == HOST_ON ||
> lastPowerState == HOST_NA)) {
> removeHostSensors();
> lastPowerState = HOST_OFF;
> }
> /* Host changed state from Off to On */
> if (isHostOn() && lastPowerState == HOST_OFF) {
> addDroppedHostSensors();
> lastPowerState = HOST_ON;
> }
> When build openBMC I got error:
> tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0: 
> error adding symbols: DSO missing from command line
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [Makefile:643: phosphor-hwmon-readd] Error 1
>
> It seems I need adding the threads lib to defend lib.
> Any suggestion to add threads lib to build configuration?
>

That must be because you're using that single boost function?  While you 
could add the dependency,
the ideal thing to do since this repo already uses 
phosphor-dbus-interfaces is to use the function:

         /** @brief Convert a string to an appropriate enum value.
          *  @param[in] s - The string to convert in the form of
          *                 "xyz.openbmc_project.State.Host.<value name>"
          *  @return - The enum value.
          */
         static HostState convertHostStateFromString(const std::string& s);

to convert it to the actual HostState enum to check against:

         enum class HostState
         {
             Off,
             Running,
             Quiesced,
             DiagnosticMode,
         };

This is all in xyz/openbmc_project/State/Host/server.hpp provided by 
phosphor-dbus-interfaces.

> Thanks.
> Thu.
>
> On Wed, Oct 21, 2020 at 11:54 PM Thu Ba Nguyen <tbnguyen1985@gmail.com 
> <mailto:tbnguyen1985@gmail.com>> wrote:
>
>     Hi Vijay,
>
>     I took a look on entity-manager and openbmc source.
>     Don't have many companies  using entity-manager model to support
>     sensors.
>
>     Regards
>     Thu Nguyen.
>
>
>     On Wed, Oct 21, 2020 at 7:15 AM Vijay Khemka <vijaykhemka@fb.com
>     <mailto:vijaykhemka@fb.com>> wrote:
>
>         *From: *openbmc
>         <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org
>         <mailto:fb.com@lists.ozlabs.org>> on behalf of Thu Ba Nguyen
>         <tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>>
>         *Date: *Monday, October 19, 2020 at 11:23 AM
>         *To: *Ed Tanous <ed@tanous.net <mailto:ed@tanous.net>>
>         *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org
>         <mailto:openbmc@lists.ozlabs.org>>
>         *Subject: *Re: Enable/Disable some sensors when Host On/Off
>
>         Hi Ed Tanous,
>
>         > Thanks for your info,
>
>         > But in your platform we are using phosphor-hwmon to manage
>         sensors.
>
>         > We don't use entity-manager.
>
>         > As I knew we can't use both entity-manager and
>         phosphor-hwmon for one project.
>
>         You can use both but for different sensors. You can decide
>         what sensors to configure
>
>         via EM/dbus-sensors and which one for phosphor-hwmon.
>
>         Regards
>
>         Thu Nguyen.
>

