Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C160F29611F
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 16:51:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH9KR1gf9zDqpH
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 01:51:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mwqsh1Ch; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH9J90wz6zDqnv
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 01:49:58 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id c15so1220327qtc.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LUpfPsfVwCGNRGbACeAVlnhTd+ZsSf6csewsPSRWii8=;
 b=mwqsh1ChpPxzkIYw5SEYgFNEytbz0r8CbluSWnrsH6V+Hms+/2QoMhui5hDAtXRfUL
 Q6ymznjr0W6uS/OWNxOYY39SelJf5qTJvhQgNsJAyJXW5jSbgiwbqW1CyRRWMnyCCB35
 NgkvYFnFqVyivarQcb1gT6LAi44T/pDV+dkEXUiIO1JTsfmifcZYIQM3u3guC7hPYidc
 odc6ifwcAQKTVLNI0W13l3OkoLTsa9JEjYEQOlgma8U/2SPOcVfywyjdlbDWF+/PXZHN
 7wbW5ZMVmUowSdKAiEnbn4AnrEl8GPKzs5hWn+R4B7Hsq7yMyQUBKjU+swllib68TtST
 NGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LUpfPsfVwCGNRGbACeAVlnhTd+ZsSf6csewsPSRWii8=;
 b=IIF1lKtQphMqkBjPwoS3bKDGqK4AiVCXiKeeX60e6ZQ2i7AmJA0rK1WuZa19JnubCR
 FNdWh86GyBDnN7/0Sdvtq2fzIpqGZkBmmMd7LGVZtomzfQYJVZKDA1HWqBrTqf3MBhGn
 oxXxqjjs/9kaPZd0ivmS0yJS+LspM6SRWOKewRlSWBnOqtzXvxedZfvx7FNGUmdJO1QB
 j+hQALWwzdcKg2OGeG2bgXTLCJqyaVv9hYnDch7KsS8u8J5gIQLcE5moxCQEv4L77E8R
 jy5L8c1ReH7m6hVYoGoeDdEGTPP3yew7tlVG7veB1yXmthTjEY58WuSItcE9/Kwq+trW
 rusQ==
X-Gm-Message-State: AOAM533uanqqEdzCZ5bdDeoHieKTlxwaA9e9Tj2mZmI+MqETnrhpd2nX
 rZG0dGlqqO1dCdCYgZg4fDKLyGh7aFIRpprP//w=
X-Google-Smtp-Source: ABdhPJyo5WVXamIkTtzPeaxNQJBPkQTC80lbdDZoWPB8t4OVPKKO20JTNSpWe5vJMtTrXPafr42KW1ko1NZfXKDwT2g=
X-Received: by 2002:a05:622a:316:: with SMTP id
 q22mr2210123qtw.335.1603378194176; 
 Thu, 22 Oct 2020 07:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
 <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
 <90950FB3-E1B3-4ACE-97C5-CB9582A94456@fb.com>
 <CALioo37b-BjgUdfZz2Vm+=6K6VMYRO9auyuHHo7=AZBFpoBzdw@mail.gmail.com>
In-Reply-To: <CALioo37b-BjgUdfZz2Vm+=6K6VMYRO9auyuHHo7=AZBFpoBzdw@mail.gmail.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Thu, 22 Oct 2020 21:49:42 +0700
Message-ID: <CALioo37LBToJaMs9Zt4q4WcMYKT_rF9zG1ujxv3q8HOQvsE8-w@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Vijay Khemka <vijaykhemka@fb.com>, Matt Spinler <mspinler@linux.ibm.com>, 
 Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000b4616005b24393c1"
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

--000000000000b4616005b24393c1
Content-Type: text/plain; charset="UTF-8"

I started on supporting enable/disable host sensors.
Everythings is fine until I add code to monitor host status as below.
bool MainLoop::isHostOn(void)
{
char buff[128];

if (!powerMatch)
{
log<level::ERR>("Power Match Not Created");
}
sprintf(buff, "isHostOn powerStatusOn: %d\n",powerStatusOn);
log<level::INFO>(buff);
return powerStatusOn;
}

std::shared_ptr<sdbusplus::bus::match::match>
MainLoop::startHostStateMonitor(void) {
return std::make_shared<sdbusplus::bus::match::match>(
*conn,
"type='signal',interface='org.freedesktop.DBus.Properties',"
"member='PropertiesChanged',arg0='xyz.openbmc_project.State.Host'",
[](sdbusplus::message::message &msg) {
std::string interfaceName;
boost::container::flat_map<std::string, std::variant<std::string>>
propertiesChanged;
try {
msg.read(interfaceName, propertiesChanged);
} catch (std::exception &e) {
log<level::ERR>("Unable to read host state\n");
return;
}
// We only want to check for CurrentHostState
if (propertiesChanged.begin()->first != "CurrentHostState") {
return;
}
auto findState = propertiesChanged.find(powProperty);
if (findState != propertiesChanged.end())
{
powerStatusOn = boost::ends_with(
std::get<std::string>(findState->second), "Running");
}
powerMatch = true;
});
}

void MainLoop::read()
{
// TODO: Issue#3 - Need to make calls to the dbus sensor cache here to
// ensure the objects all exist?

/* Host changed state from On to Off */
if (!isHostOn() && (lastPowerState == HOST_ON ||
lastPowerState == HOST_NA)) {
removeHostSensors();
lastPowerState = HOST_OFF;
}

/* Host changed state from Off to On */
if (isHostOn() && lastPowerState == HOST_OFF) {
addDroppedHostSensors();
lastPowerState = HOST_ON;
}

When build openBMC I got error:
tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:
error adding symbols: DSO missing from command line
| collect2: error: ld returned 1 exit status
| make[2]: *** [Makefile:643: phosphor-hwmon-readd] Error 1

It seems I need adding the threads lib to defend lib.
Any suggestion to add threads lib to build configuration?

Thanks.
Thu.

On Wed, Oct 21, 2020 at 11:54 PM Thu Ba Nguyen <tbnguyen1985@gmail.com>
wrote:

> Hi Vijay,
>
> I took a look on entity-manager and openbmc source.
> Don't have many companies  using entity-manager model to support sensors.
>
> Regards
> Thu Nguyen.
>
>
> On Wed, Oct 21, 2020 at 7:15 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>>
>>
>>
>>
>> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on
>> behalf of Thu Ba Nguyen <tbnguyen1985@gmail.com>
>> *Date: *Monday, October 19, 2020 at 11:23 AM
>> *To: *Ed Tanous <ed@tanous.net>
>> *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> *Subject: *Re: Enable/Disable some sensors when Host On/Off
>>
>>
>>
>> Hi Ed Tanous,
>>
>>
>>
>> > Thanks for your info,
>>
>> > But in your platform we are using phosphor-hwmon to manage sensors.
>>
>> > We don't use entity-manager.
>>
>> > As I knew we can't use both entity-manager and phosphor-hwmon for one
>> project.
>>
>>
>>
>> You can use both but for different sensors. You can decide what sensors
>> to configure
>>
>> via EM/dbus-sensors and which one for phosphor-hwmon.
>>
>>
>>
>> Regards
>>
>> Thu Nguyen.
>>
>

--000000000000b4616005b24393c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">I started on supporting enable/disable host sensors.<div>Everythi=
ngs is fine until=C2=A0I add code to monitor host status as below.</div><di=
v><div style=3D"color:rgb(0,0,0)"><div style=3D"color:rgb(212,212,212);back=
ground-color:rgb(30,30,30);font-family:Menlo,Monaco,&quot;Courier New&quot;=
,monospace;font-size:18px;line-height:27px;white-space:pre"><div><span styl=
e=3D"color:rgb(86,156,214)">bool</span> <span style=3D"color:rgb(78,201,176=
)">MainLoop</span>::<span style=3D"color:rgb(220,220,170)">isHostOn</span>(=
<span style=3D"color:rgb(86,156,214)">void</span>)</div><div>{</div><div>  =
  <span style=3D"color:rgb(86,156,214)">char</span> <span style=3D"color:rg=
b(156,220,254)">buff</span>[<span style=3D"color:rgb(181,206,168)">128</spa=
n>];</div><br><div>    <span style=3D"color:rgb(197,134,192)">if</span> (!p=
owerMatch)</div><div>    {</div><div>        <span style=3D"color:rgb(220,2=
20,170)">log</span>&lt;<span style=3D"color:rgb(78,201,176)">level</span>::=
<span style=3D"color:rgb(78,201,176)">ERR</span>&gt;(<span style=3D"color:r=
gb(206,145,120)">&quot;Power Match Not Created&quot;</span>);</div><div>   =
 }</div><div>    <span style=3D"color:rgb(220,220,170)">sprintf</span>(buff=
, <span style=3D"color:rgb(206,145,120)">&quot;isHostOn powerStatusOn: %d</=
span><span style=3D"color:rgb(215,186,125)">\n</span><span style=3D"color:r=
gb(206,145,120)">&quot;</span>,powerStatusOn);</div><div>    <span style=3D=
"color:rgb(220,220,170)">log</span>&lt;<span style=3D"color:rgb(78,201,176)=
">level</span>::<span style=3D"color:rgb(78,201,176)">INFO</span>&gt;(buff)=
;</div><div>    <span style=3D"color:rgb(197,134,192)">return</span> powerS=
tatusOn;</div><div>}</div><br><div><span style=3D"color:rgb(78,201,176)">st=
d</span>::shared_ptr&lt;<span style=3D"color:rgb(78,201,176)">sdbusplus</sp=
an>::<span style=3D"color:rgb(78,201,176)">bus</span>::<span style=3D"color=
:rgb(78,201,176)">match</span>::match&gt; </div><div>    <span style=3D"col=
or:rgb(78,201,176)">MainLoop</span>::<span style=3D"color:rgb(220,220,170)"=
>startHostStateMonitor</span>(<span style=3D"color:rgb(86,156,214)">void</s=
pan>) {</div><div>    <span style=3D"color:rgb(197,134,192)">return</span> =
<span style=3D"color:rgb(78,201,176)">std</span>::<span style=3D"color:rgb(=
220,220,170)">make_shared</span>&lt;<span style=3D"color:rgb(78,201,176)">s=
dbusplus</span>::<span style=3D"color:rgb(78,201,176)">bus</span>::<span st=
yle=3D"color:rgb(78,201,176)">match</span>::<span style=3D"color:rgb(78,201=
,176)">match</span>&gt;(</div><div>    *conn,</div><div>    <span style=3D"=
color:rgb(206,145,120)">&quot;type=3D&#39;signal&#39;,interface=3D&#39;org.=
freedesktop.DBus.Properties&#39;,&quot;</span></div><div>    <span style=3D=
"color:rgb(206,145,120)">&quot;member=3D&#39;PropertiesChanged&#39;,arg0=3D=
&#39;xyz.openbmc_project.State.Host&#39;&quot;</span>,</div><div>    [](<sp=
an style=3D"color:rgb(78,201,176)">sdbusplus</span>::<span style=3D"color:r=
gb(78,201,176)">message</span>::<span style=3D"color:rgb(78,201,176)">messa=
ge</span> <span style=3D"color:rgb(86,156,214)">&amp;</span><span style=3D"=
color:rgb(156,220,254)">msg</span>) {</div><div>    <span style=3D"color:rg=
b(78,201,176)">std</span>::string interfaceName;</div><div>    <span style=
=3D"color:rgb(78,201,176)">boost</span>::<span style=3D"color:rgb(78,201,17=
6)">container</span>::flat_map&lt;<span style=3D"color:rgb(78,201,176)">std=
</span>::string, <span style=3D"color:rgb(78,201,176)">std</span>::variant&=
lt;<span style=3D"color:rgb(78,201,176)">std</span>::string&gt;&gt;</div><d=
iv>        propertiesChanged;</div><div>    <span style=3D"color:rgb(197,13=
4,192)">try</span> {</div><div>        <span style=3D"color:rgb(156,220,254=
)">msg</span>.<span style=3D"color:rgb(220,220,170)">read</span>(interfaceN=
ame, propertiesChanged);</div><div>    } <span style=3D"color:rgb(197,134,1=
92)">catch</span> (<span style=3D"color:rgb(78,201,176)">std</span>::except=
ion &amp;e) {</div><div>        <span style=3D"color:rgb(220,220,170)">log<=
/span>&lt;<span style=3D"color:rgb(78,201,176)">level</span>::<span style=
=3D"color:rgb(78,201,176)">ERR</span>&gt;(<span style=3D"color:rgb(206,145,=
120)">&quot;Unable to read host state</span><span style=3D"color:rgb(215,18=
6,125)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</span>);</di=
v><div>        <span style=3D"color:rgb(197,134,192)">return</span>;</div><=
div>    }</div><div><span style=3D"color:rgb(106,153,85)">    // We only wa=
nt to check for CurrentHostState</span></div><div>    <span style=3D"color:=
rgb(197,134,192)">if</span> (<span style=3D"color:rgb(156,220,254)">propert=
iesChanged</span>.<span style=3D"color:rgb(220,220,170)">begin</span>()-&gt=
;<span style=3D"color:rgb(156,220,254)">first</span> !=3D <span style=3D"co=
lor:rgb(206,145,120)">&quot;CurrentHostState&quot;</span>) {</div><div>    =
    <span style=3D"color:rgb(197,134,192)">return</span>;</div><div>    }</=
div><div>    <span style=3D"color:rgb(86,156,214)">auto</span> findState =
=3D <span style=3D"color:rgb(156,220,254)">propertiesChanged</span>.<span s=
tyle=3D"color:rgb(220,220,170)">find</span>(powProperty);</div><div>    <sp=
an style=3D"color:rgb(197,134,192)">if</span> (findState !=3D <span style=
=3D"color:rgb(156,220,254)">propertiesChanged</span>.<span style=3D"color:r=
gb(220,220,170)">end</span>())</div><div>    {</div><div>        powerStatu=
sOn =3D <span style=3D"color:rgb(78,201,176)">boost</span>::<span style=3D"=
color:rgb(220,220,170)">ends_with</span>(</div><div>            <span style=
=3D"color:rgb(78,201,176)">std</span>::<span style=3D"color:rgb(220,220,170=
)">get</span>&lt;<span style=3D"color:rgb(78,201,176)">std</span>::<span st=
yle=3D"color:rgb(78,201,176)">string</span>&gt;(<span style=3D"color:rgb(15=
6,220,254)">findState</span>-&gt;<span style=3D"color:rgb(156,220,254)">sec=
ond</span>), <span style=3D"color:rgb(206,145,120)">&quot;Running&quot;</sp=
an>);</div><div>    }</div><div>    powerMatch =3D <span style=3D"color:rgb=
(86,156,214)">true</span>;</div><div>    });</div><div>}</div><div><br></di=
v></div></div><div style=3D"color:rgb(0,0,0)"><div style=3D"color:rgb(212,2=
12,212);background-color:rgb(30,30,30);font-family:Menlo,Monaco,&quot;Couri=
er New&quot;,monospace;font-size:18px;line-height:27px;white-space:pre-wrap=
"><div><span style=3D"color:rgb(86,156,214)">void</span> <span style=3D"col=
or:rgb(78,201,176)">MainLoop</span>::<span style=3D"color:rgb(220,220,170)"=
>read</span>()</div><div>{</div><div><span style=3D"color:rgb(106,153,85)">=
    // TODO: Issue#3 - Need to make calls to the dbus sensor cache here to<=
/span></div><div><span style=3D"color:rgb(106,153,85)">    //       ensure =
the objects all exist?</span></div><br><div><span style=3D"color:rgb(106,15=
3,85)">    /* Host changed state from On to Off */</span></div><div>    <sp=
an style=3D"color:rgb(197,134,192)">if</span> (!<span style=3D"color:rgb(22=
0,220,170)">isHostOn</span>() &amp;&amp; (lastPowerState =3D=3D HOST_ON ||<=
/div><div>            lastPowerState =3D=3D HOST_NA)) {</div><div>        <=
span style=3D"color:rgb(220,220,170)">removeHostSensors</span>();</div><div=
>        lastPowerState =3D HOST_OFF;</div><div>    }</div><br><div><span s=
tyle=3D"color:rgb(106,153,85)">    /* Host changed state from Off to On */<=
/span></div><div>    <span style=3D"color:rgb(197,134,192)">if</span> (<spa=
n style=3D"color:rgb(220,220,170)">isHostOn</span>() &amp;&amp; lastPowerSt=
ate =3D=3D HOST_OFF) {</div><div>        <span style=3D"color:rgb(220,220,1=
70)">addDroppedHostSensors</span>();</div><div>        lastPowerState =3D H=
OST_ON;</div><div>    }</div><div><br></div></div></div></div><div>When bui=
ld openBMC I got error:</div><div><div>tmp/work/arm1176jzs-openbmc-linux-gn=
ueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpth=
read.so.0: error adding symbols: DSO missing from command line</div><div>| =
collect2: error: ld returned 1 exit status</div><div>| make[2]: *** [Makefi=
le:643: phosphor-hwmon-readd] Error 1</div></div><div><br></div><div>It see=
ms I need adding the threads lib to defend lib.</div><div>Any suggestion to=
 add threads lib to build configuration?</div><div><br></div><div>Thanks.</=
div><div>Thu.</div></div></div></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 21, 2020 at 11:54 PM=
 Thu Ba Nguyen &lt;<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_bla=
nk">tbnguyen1985@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div>Hi Vijay,</div><div><br></div>I took a look on entity-manage=
r=C2=A0and openbmc source.<div>Don&#39;t have=C2=A0many companies =C2=A0usi=
ng entity-manager model to support sensors.</div><div><br></div><div>Regard=
s</div><div>Thu Nguyen.</div><div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 21, 2020 at 7:15 AM=
 Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">v=
ijaykhemka@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US" style=3D"word-wrap:break-word">
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-style:solid none none;border-top-width:1pt;border-top-=
color:rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of Thu Ba Nguyen &lt;<a hr=
ef=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.c=
om</a>&gt;<br>
<b>Date: </b>Monday, October 19, 2020 at 11:23 AM<br>
<b>To: </b>Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank"=
>ed@tanous.net</a>&gt;<br>
<b>Cc: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: Enable/Disable some sensors when Host On/Off<u></u><u><=
/u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Hi Ed Tanous,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; Thanks for your info,=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; But in your platform we are using phosphor-hwmo=
n to manage sensors.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; We don&#39;t use entity-manager.<u></u><u></u><=
/p>
</div>
<div>
<p class=3D"MsoNormal">&gt; As I knew we can&#39;t use both entity-manager =
and phosphor-hwmon for one project.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">You can use both but for different sensors. You can =
decide what sensors to configure<u></u><u></u></p>
<p class=3D"MsoNormal">via EM/dbus-sensors and which one for phosphor-hwmon=
.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thu Nguyen.<u></u><u></u></p>
</div>
</div>
</div>
</div>

</blockquote></div>
</blockquote></div>

--000000000000b4616005b24393c1--
