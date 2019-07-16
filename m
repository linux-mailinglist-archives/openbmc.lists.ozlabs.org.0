Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAC16B061
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 22:24:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pBhF1kxHzDqfX
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 06:24:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2b; helo=mail-yw1-xc2b.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iauMPFVk"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2b.google.com (mail-yw1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pBdr1W3tzDqdk
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 06:22:22 +1000 (AEST)
Received: by mail-yw1-xc2b.google.com with SMTP id l79so9468695ywe.11
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 13:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e/6BmpHw1vMECnF70rkyWJuh06fOJPXRpUfxhMnSEJo=;
 b=iauMPFVkKQMNctnNlSAacBoYiidm8lCZNFL2WdDIUnjsBZE1jIEl518PhbjMVW2A2X
 /CXbzCwdkG9UiAvryvCoocwjMss4iYZaiAN641SdluROxTJUppLBOzsHql8zSoluGs39
 xkekNIdNXvo2X/gTJYANR8F65fKvFim5buiSjLHtqxeKbJdapY/0/HlyvNnjHgvWp3ro
 145fK4NJ8WQEheL//znnlF/OlPVDvRLyRn8wObqCCwds0YQcKWbK20LVBcL3N0QGebFu
 6j60PYahkxjI+6AH4Qy6k7wH9wJG2+ctzWGvFoNm46xQ4L8VjouAf1ndmyFNvqk+XI9L
 ZiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e/6BmpHw1vMECnF70rkyWJuh06fOJPXRpUfxhMnSEJo=;
 b=l9LVWUBYNCTT8Fv95lP2ewzRMhqkuGhEYEUTVMGDfyO/oHjuS07A7C4jIFJ9Ij6WVn
 BYvNTvSnLcNvHJLq43Kej52YOD/Ppl/eXlP9jNE/JIRsbC8AmNM+5/d45w0hPdNT2DaT
 jteETeMvvuqssIeF1XIvzVvqJfCtKA3cenE0l+YxglYA70FPGaJFDuKe0Ukcc2amyIct
 TtRiBGKzQmSBFRqIzq5+7vAA2EiXNofjOV9Wace5POkZbpKT7puBeR7x6lByZutZ0B1x
 pUFts3392RNzQcazCuMJxjyeHcPTfrX/lLzaNSTw/J+53N+rK5jVCaHjvK0A1/Z1C5Af
 UHug==
X-Gm-Message-State: APjAAAVzTgX7nXjoZhf+PPnTJQVscmk/2PMaTMcXm2j968g/W86K3XhE
 xIweWMToYVmRYEMbgIEedLHvKubBQknq18jh4Ws=
X-Google-Smtp-Source: APXvYqzsQ/TzGmV3W0RL5JJDtZx02Od8sJHhNB/UWLDllFcufzqPStjK1YZeMlkU0wUtHpnzC7AaqOUckPtSYnFtPF0=
X-Received: by 2002:a81:550c:: with SMTP id j12mr20583717ywb.503.1563308538162; 
 Tue, 16 Jul 2019 13:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
 <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
 <CAMTupoQ9fovzOcFH__Ljq=y8RKAp8_7WYunzQ8xNcc6Qjk+Dvg@mail.gmail.com>
 <tencent_799D81715559779D478D3D61@qq.com>
 <CAOUmYFTVYjXwXP_oC6+yMUaUS8d15=Ys5BDqGjc-N5JBQC8HQg@mail.gmail.com>
 <tencent_1BF1F4AC2B9970D9471A8668@qq.com>
 <CAMTupoTUFv3TCY=D8OatOTCeoBdCsbqXVep5ZM6vXdJ1EGgr-A@mail.gmail.com>
 <181ab467.6aa8.16b8d45bb45.Coremail.rxsun@zd-tech.com.cn>
 <CAMTupoT26K4x4RB+=DiEphFfKZWhBm-ysb17J+thmuxkTVJodQ@mail.gmail.com>
 <14DDB6E3-8F8F-4536-835A-35B7D2AD3A76@zd-tech.com.cn>
 <CAMTupoQuwmjkpfF-f7CS7XNw1bT-bzZ5xqW2deVPqT7hPHe6dA@mail.gmail.com>
 <d72c930c-b170-d706-0bc2-6d1c2122cc69@zd-tech.com.cn>
 <CAMTupoRCx1vvAfbhmjzBTmmg6_5Y=MhjwvHw29eEcAc5sJJVPQ@mail.gmail.com>
 <bda55054-71e9-c1eb-e65f-d14e207ac0b5@zd-tech.com.cn>
In-Reply-To: <bda55054-71e9-c1eb-e65f-d14e207ac0b5@zd-tech.com.cn>
From: Jandra A <jandraara@gmail.com>
Date: Tue, 16 Jul 2019 15:22:07 -0500
Message-ID: <CAMTupoQszBizz56n=Dps4fcGQoORw2kDcgjfxy4bvGK1cUomFQ@mail.gmail.com>
Subject: Re: Network Settings GUI
To: =?UTF-8?B?5a2Z55Ge6Zye?= <rxsun@zd-tech.com.cn>
Content-Type: multipart/related; boundary="000000000000184fa7058dd222fc"
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
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 Derick <derick.montague@gmail.com>, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000184fa7058dd222fc
Content-Type: multipart/alternative; boundary="000000000000184fa5058dd222fb"

--000000000000184fa5058dd222fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ruixia,

Thanks for the clarification. I wanted to let you know we are still working
on this and hoping to get it to you all as soon as we can. I want to make
sure we are understanding the requirements for Lenovo:

- Need the ability to support both IPV4 and IPV6 simultaneously on a single
interface.
- In the case the both IPV4 and IPV6 are enabled in a single interface,
zero-configuration cannot assign addresses to either.
- The format for IPV6 DNS servers is the same as IPV6 IP addresses. Do each
of these also have a Fully Qualified Domain Name (FQDN)?
- Only two IP addresses maximum (in addition to those provided by
zero-config, if any) will be supported per interface. If there are two, one
must be IPV4 and one must be IPV6.
- For IPV6, we will support either DHCP or static configurations, not both
at the same time on the same interface. Same applies for IPV6, though IPV4
can be different from IPV6.

Thank you for your patience with us.

Regards,
Jandra Aranguren

On Wed, Jul 3, 2019 at 12:49 AM =E5=AD=99=E7=91=9E=E9=9C=9E <rxsun@zd-tech.=
com.cn> wrote:

> Hi Jandra,
> >>In the case that DHCP doesn't give either=EF=BC=8C both IPV4 and IPV6 a=
re
> enabled.
> >>In the case that IPV6 DHCP is given ,IPV6 are disabled,so are IPV4.
>
> >Can you clarify this? I do not follow.
>
> when both IPV4 and IPV6 are enabled and DHCP is disabled and the user
> input nothing to IPV4 and IPV6 address input box =EF=BC=88zeroconf=EF=BC=
=89,in this case,it
> shall not to assign any IP address to bmc network device, the webui shoul=
d
> give an error tips to users.
>
> It only works when the user input the correct format IP address.
> PS:Having a check box to enable ipv4 and ipv6 configuration would be
> better.
> One useful link:
> https://support.code42.com/Administrator/6/Configuring/How_to_use_both_IP=
v4_and_IPv6_in_your_Code42_environment
> Best,
> Ruixia
>
> =E5=9C=A8 2019/7/2 =E4=B8=8B=E5=8D=888:57, Jandra A =E5=86=99=E9=81=93:
>
>
>>    - In the case that DHCP doesn't give either=EF=BC=8C both IPV4 and IP=
V6 are
>>    enabled.
>>
>>
>>    - In the case that IPV6 DHCP is given ,IPV6 are disabled,so are IPV4.
>>
>>
> Can you clarify this? I do not follow.
>
> On Tue, Jul 2, 2019 at 3:14 AM =E5=AD=99=E7=91=9E=E9=9C=9E <rxsun@zd-tech=
.com.cn> wrote:
>
>> Hi=EF=BC=8C
>>
>> The following item is expected,
>>
>>    - In the case that DHCP doesn't give either=EF=BC=8C both IPV4 and IP=
V6 are
>>    enabled.
>>
>>
>>    - In the case that IPV6 DHCP is given ,IPV6 are disabled,so are IPV4.
>>
>>
>>    - IPV6 DNS servers  is in the format of an IPV6 IP address.
>>
>> it will be similar with the picture below, maybe.
>>
>> Best regard, thanks.
>>
>> ruixia,sun.
>>
>>
>> =E5=9C=A8 2019/7/1 =E4=B8=8B=E5=8D=8811:26, Jandra A =E5=86=99=E9=81=93:
>>
>> Ruixia -- I am waiting on a couple of responses from our backend team to
>> be able to provide a design that aligns with how the functionality is
>> developed.
>>
>> Ratan -- I'm helping create the design mockup for including IPV6 in the
>> Network settings panel so that Lenovo can do the front-end implementatio=
n.
>> Do you know if the work your team was doing for this will be merged to t=
he
>> master soon?
>>
>> I have some questions I am hoping you can help answer for this IPV6
>> design:
>> - What happens to zeroconf when both IPV4 and IPV6 are enabled? Does it
>> try to assign an IP address to both (in the case that DHCP doesn't give
>> either) or does it only assign either an IPV4 IP address or an IPV6 IP
>> address?
>> - What is the format of IPV6 DNS servers? Is that also in the format of
>> an IPV6 IP address?
>>
>> I have built the latest openbmc project image by adding the option "ipv6=
"
>>> in the term DISTRO_FEATURES_DEFAULT in the file
>>> /meta-phosphor/conf/distro/include/phosphor-base.inc. I can ping the
>>> openbmc  IPV6 IP successfully, but cannot login to it by openssh comman=
d.
>>> It seemed that there are some works on openbmc embedded OS to support
>>> IPV6.
>>> Another issue from Ruixia is the IPV6 Dbus Interfaces design, I found
>>> there are some IPV6 rest-Dbus or Redfish interfaces on yaml files
>>> available. I don' t know is it enough to the IPV6 webui.
>>
>>
>> Ratan, would you be able to help Ruixia and Xiuzhi with this?
>>
>> Regards,
>> Jandra Aranguren
>>
>>
>> On Mon, Jul 1, 2019 at 9:27 AM =E5=AD=99=E7=91=9E=E9=9C=9E <rxsun@zd-tec=
h.com.cn> wrote:
>>
>>> hi=EF=BC=8C
>>> After the meeting of last week=EF=BC=8CI was expecting the email about =
ipv6 ui
>>> designing and ipv6 interface with web server =EF=BC=8Cwhen will I recei=
ve it=EF=BC=9FShould
>>> we have another meeting this week=EF=BC=9F
>>> best regard=EF=BC=81
>>>
>>> ruixia=EF=BC=8Csun
>>>
>>>
>>> =E5=AD=99=E7=91=9E=E9=9C=9E
>>> =E9=82=AE=E7=AE=B1=EF=BC=9Arxsun@zd-tech.com.cn
>>>
>>> <https://maas.mail.163.com/dashi-web-extend/html/proSignature.html?icon=
Url=3Dhttps%3A%2F%2Fmail-online.nosdn.127.net%2Fqiyelogo%2FdefaultAvatar.pn=
g&name=3D%E5%AD%99%E7%91%9E%E9%9C%9E&uid=3Dexample%40163.com&ftlId=3D3&item=
s=3D%5B%22%E9%82%AE%E7%AE%B1%EF%BC%9Arxsun%40zd-tech.com.cn%22%5D>
>>>
>>> =E7=AD=BE=E5=90=8D=E7=94=B1 =E7=BD=91=E6=98=93=E9=82=AE=E7=AE=B1=E5=A4=
=A7=E5=B8=88 <https://mail.163.com/dashi/dlpro.html?from=3Dmail88> =E5=AE=
=9A=E5=88=B6
>>> On 06/25/2019 23:25, Jandra A <jandraara@gmail.com> wrote:
>>>
>>> Great, let's meet using my webex
>>> https://ibm.webex.com/meet/jandra.aranguren I will send you an invite
>>> as well.
>>>
>>> On Tue, Jun 25, 2019 at 1:16 AM =E5=AD=99=E7=91=9E=E9=9C=9E <rxsun@zd-t=
ech.com.cn> wrote:
>>>
>>>> Hi,all,
>>>> I will be glad to meet at 7:00AM Central time this Wednesday (June
>>>> 26th).
>>>>
>>>> Ruixia,Sun
>>>>
>>>>
>>>>
>>>> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A"Jandra A" <jandraara@gmail.com>
>>>> =E5=8F=91=E9=80=81=E6=97=A5=E6=9C=9F=EF=BC=9A2019-06-25 00:51:39
>>>> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9Axiuzhi <1450335857@qq.com>
>>>> =E6=8A=84=E9=80=81=E4=BA=BA=EF=BC=9ADerick <derick.montague@gmail.com>=
,openbmc <
>>>> openbmc@lists.ozlabs.org>,rxsun <rxsun@zd-tech.com.cn>
>>>> =E4=B8=BB=E9=A2=98=EF=BC=9ARe: Re: Network Settings GUI
>>>>
>>>> Hi Xiuzhi and Ruixia,
>>>>
>>>> It would be great to set some time to align on the requirements from
>>>> design and how to work together so that your team can start on the so
>>>> front-end development.
>>>>
>>>> Like Derick said, we meet every other Wednesday at 10:00 Central time
>>>> to discuss GUI issues, with the next one being next Wednesday (July 3r=
d).
>>>> Hopefully you can make that.
>>>>
>>>> If you cannot, I am happy to meet at 7:00 or 8:00 AM Central time this
>>>> Wednesday (June 26th) or Friday (June 28th). Please let me know.
>>>>
>>>> Regards,
>>>>
>>>> On Wed, Jun 19, 2019 at 8:30 PM xiuzhi <1450335857@qq.com> wrote:
>>>>
>>>>> Hi Derick,
>>>>> >> The IPV6 webui should support both IPV4 and IPV6 on a single
>>>>> interface at the same time and users can set IPV4 and IPV6 on the sam=
e
>>>>> network webpage from Lenovo test cases.
>>>>>
>>>>> >Thank you!
>>>>>
>>>>> >>  Ruixia (her email: rxsun@zd-tech.com.cn;), form my team can do
>>>>> front-end  to implement your design .  It would be best if the IPV6 f=
eature
>>>>> could be achieved in one to two months.
>>>>>
>>>>> >It would be great if she were able to join our GUI Community
>>>>> workgroup. It's every other Wednesday at 10:00 Central Time. We use
>>>>> these to discuss all the GUI issues. Where are you located?
>>>>>   I am in BeiJing  UTC+8. The meeting time is  Wednesday  23:00
>>>>> Beijing Time (Wednesday 10:00 am Central Daylight Time),isn't it?
>>>>> >GUI Community Workgroup Wiki:
>>>>> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>>>>>
>>>>> Best,
>>>>> Xiuzhi
>>>>>
>>>>

--000000000000184fa5058dd222fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ruixia,=C2=A0<div><br></div><div>Thanks for the clarifi=
cation. I wanted to let you know we are still working on this and hoping to=
 get it to you all as soon as we can. I want to make sure we are understand=
ing the requirements for Lenovo:</div><div><br></div><div>- Need the abilit=
y to support both IPV4 and IPV6 simultaneously on a single interface.</div>=
<div>- In the case the both IPV4 and IPV6 are enabled in a single interface=
, zero-configuration cannot assign addresses to either.=C2=A0</div><div>- T=
he format for IPV6 DNS servers is the same as IPV6 IP addresses. Do each of=
 these also have a Fully Qualified Domain Name (FQDN)?=C2=A0</div><div>- On=
ly two IP addresses maximum (in addition to those provided by zero-config, =
if any) will be supported per interface. If there are two, one must be IPV4=
 and one must be IPV6.=C2=A0</div><div>- For IPV6, we will support either D=
HCP or static configurations, not both at the same time on the same interfa=
ce. Same applies for IPV6, though IPV4 can be different from IPV6.=C2=A0</d=
iv><div><br></div><div>Thank you for your patience with us.=C2=A0</div><div=
><br></div><div>Regards,</div><div>Jandra Aranguren</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 3, 201=
9 at 12:49 AM =E5=AD=99=E7=91=9E=E9=9C=9E &lt;<a href=3D"mailto:rxsun@zd-te=
ch.com.cn">rxsun@zd-tech.com.cn</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Hi Jandra,<br>
      &gt;&gt;In the case that DHCP doesn&#39;t give either=EF=BC=8C both I=
PV4 and
      IPV6 are enabled.<br>
      &gt;&gt;In the case that IPV6 DHCP is given ,IPV6 are disabled,so
      are IPV4.<br>
      <br>
      &gt;Can you clarify this? I do not follow.<br>
      <br>
      when both IPV4 and IPV6 are enabled and DHCP is disabled and the
      user input nothing to IPV4 and IPV6 address input box
      =EF=BC=88zeroconf=EF=BC=89,in this case,it shall not to assign any IP=
 address to
      bmc network device, the webui should give an error tips to users.<br>
      <br>
      It only works when the user input the correct format IP address.<br>
      PS:Having a check box to enable ipv4 and ipv6 configuration would
      be better.<br>
      One useful
link:<a class=3D"gmail-m_2327925860975938968moz-txt-link-freetext" href=3D"=
https://support.code42.com/Administrator/6/Configuring/How_to_use_both_IPv4=
_and_IPv6_in_your_Code42_environment" target=3D"_blank">https://support.cod=
e42.com/Administrator/6/Configuring/How_to_use_both_IPv4_and_IPv6_in_your_C=
ode42_environment</a><br>
      Best,<br>
      Ruixia<br>
      <br>
    </p>
    <div class=3D"gmail-m_2327925860975938968moz-cite-prefix">=E5=9C=A8 201=
9/7/2 =E4=B8=8B=E5=8D=888:57, Jandra A =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <ul>
            <li style=3D"margin-left:15px">In the case that DHCP doesn&#39;=
t
              give either=EF=BC=8C both IPV4 and IPV6 are enabled.</li>
          </ul>
          <ul>
            <li style=3D"margin-left:15px">In the case that IPV6 DHCP is
              given ,IPV6 are disabled,so are IPV4.</li>
          </ul>
        </blockquote>
        <div><br>
        </div>
        <div>Can you clarify this? I do not follow.=C2=A0=C2=A0</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 2, 2019 at 3:14 A=
M
          =E5=AD=99=E7=91=9E=E9=9C=9E &lt;<a href=3D"mailto:rxsun@zd-tech.c=
om.cn" target=3D"_blank">rxsun@zd-tech.com.cn</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div bgcolor=3D"#FFFFFF">
            <p>Hi=EF=BC=8C</p>
            <p>The following item is expected,<br>
            </p>
            <ul>
              <li>In the case that DHCP doesn&#39;t give either=EF=BC=8C bo=
th IPV4
                and IPV6 are enabled.</li>
            </ul>
            <ul>
              <li>In the case that IPV6 DHCP is given ,IPV6 are
                disabled,so are IPV4.<br>
              </li>
            </ul>
            <ul>
              <li> IPV6 DNS servers=C2=A0 is in the format of an IPV6 IP
                address.</li>
            </ul>
            <p>it will be similar with the picture below, maybe.<br>
            </p>
            <img src=3D"cid:16bfc6d240bae9d23e51" alt=3D"" width=3D"509" he=
ight=3D"509"><br>
            <p>Best regard, thanks.</p>
            <p>ruixia,sun.</p>
            <p><br>
            </p>
            <div class=3D"gmail-m_2327925860975938968gmail-m_82077113573683=
44562moz-cite-prefix">=E5=9C=A8
              2019/7/1 =E4=B8=8B=E5=8D=8811:26, Jandra A =E5=86=99=E9=81=93=
:<br>
            </div>
            <blockquote type=3D"cite">
              <div dir=3D"ltr">
                <div>Ruixia -- I am waiting on a couple of responses
                  from our backend team to be able to provide a design
                  that aligns with how the functionality is developed.=C2=
=A0</div>
                <div><br>
                </div>
                <div>Ratan -- I&#39;m helping create the design mockup for
                  including IPV6 in the Network settings panel so that
                  Lenovo can do the front-end implementation. Do you
                  know if the work your team was doing for this will be
                  merged to the master soon?</div>
                <br>
                I have some questions I am hoping you can help answer
                for this IPV6 design:=C2=A0
                <div>- What happens to zeroconf when both IPV4 and IPV6
                  are enabled? Does it try to assign an IP address to
                  both (in the case that DHCP doesn&#39;t give either) or
                  does it only assign either an IPV4 IP address or an
                  IPV6 IP address?
                  <div>- What is the format of IPV6 DNS servers? Is that
                    also in the format of an IPV6 IP address?<br>
                    <br>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span=
 class=3D"gmail-m_2327925860975938968gmail-m_8207711357368344562gmail-im" s=
tyle=3D"color:rgb(80,0,80)">I have built the
                        latest openbmc project image by adding the
                        option &quot;ipv6&quot; in the term
                        DISTRO_FEATURES_DEFAULT in the file
                        /meta-phosphor/conf/distro/include/phosphor-base.in=
c.
                        I can ping the openbmc=C2=A0 IPV6 IP successfully,
                        but cannot login to it by openssh command.<br>
                        It seemed that there are some works on openbmc
                        embedded OS to support IPV6.<br>
                        Another issue from Ruixia is the IPV6 Dbus
                        Interfaces design, I found there are some IPV6
                        rest-Dbus or Redfish interfaces on yaml files
                        available. I don&#39; t know is it enough to the
                        IPV6 webui.</span></blockquote>
                    <div><br>
                    </div>
                    Ratan, would you be able to help Ruixia and Xiuzhi
                    with this?</div>
                  <div><br>
                  </div>
                  <div>Regards,</div>
                  <div>Jandra Aranguren=C2=A0</div>
                  <div class=3D"gmail-m_2327925860975938968gmail-m_82077113=
57368344562gmail-yj6qo gmail-m_2327925860975938968gmail-m_82077113573683445=
62gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0=
px 0px"><br class=3D"gmail-m_2327925860975938968gmail-m_8207711357368344562=
gmail-Apple-interchange-newline">
                  </div>
                </div>
              </div>
              <br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 1, 2019 a=
t
                  9:27 AM =E5=AD=99=E7=91=9E=E9=9C=9E &lt;<a href=3D"mailto=
:rxsun@zd-tech.com.cn" target=3D"_blank">rxsun@zd-tech.com.cn</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div id=3D"gmail-m_2327925860975938968gmail-m_820771135=
7368344562gmail-m_1619914329257948851contentDescription" style=3D"line-heig=
ht:1.5;text-align:justify">
                      <div id=3D"gmail-m_2327925860975938968gmail-m_8207711=
357368344562gmail-m_1619914329257948851imail_extraContent">hi=EF=BC=8C
                        <br>
                        After the meeting of last week=EF=BC=8CI was expect=
ing
                        the email about ipv6 ui designing and ipv6
                        interface with web server =EF=BC=8Cwhen will I rece=
ive
                        it=EF=BC=9FShould we have another meeting this week=
=EF=BC=9F <br>
                        best regard=EF=BC=81 <br>
                        <br>
                        ruixia=EF=BC=8Csun</div>
                      <div><br>
                      </div>
                      <div><br>
                      </div>
                      <div class=3D"gmail-m_2327925860975938968gmail-m_8207=
711357368344562gmail-m_1619914329257948851NETEASEMAILMASTERLOCALSIGNATURE">
                        <div id=3D"gmail-m_2327925860975938968gmail-m_82077=
11357368344562gmail-m_1619914329257948851imail_signature">
                          <div style=3D"margin:0px;padding:0px"> <a href=3D=
"https://maas.mail.163.com/dashi-web-extend/html/proSignature.html?iconUrl=
=3Dhttps%3A%2F%2Fmail-online.nosdn.127.net%2Fqiyelogo%2FdefaultAvatar.png&a=
mp;name=3D%E5%AD%99%E7%91%9E%E9%9C%9E&amp;uid=3Dexample%40163.com&amp;ftlId=
=3D3&amp;items=3D%5B%22%E9%82%AE%E7%AE%B1%EF%BC%9Arxsun%40zd-tech.com.cn%22=
%5D" width=3D"400" style=3D"display:block;max-width:400px;background:rgb(25=
5,255,255);padding:15px 0px 10px;text-decoration:none;outline:none" target=
=3D"_blank">
                              <table style=3D"width:100%;max-width:100%;tab=
le-layout:fixed;border-collapse:collapse;border-spacing:0px;line-height:1.3=
;color:rgb(155,158,161);font-size:14px" cellpadding=3D"0">
                                <tbody>
                                  <tr>
                                    <td style=3D"padding:0px 7px 0px 0px;bo=
x-sizing:border-box;width:45px" width=3D"45"> <img style=3D"width: 38px; he=
ight: 38px; border-radius: 50%;" src=3D"https://mail-online.nosdn.127.net/q=
iyelogo/defaultAvatar.png" width=3D"38" height=3D"38"> </td>
                                    <td style=3D"padding:0px 0px 0px 7px">
                                      <div style=3D"max-width:380px">
                                        <div style=3D"box-sizing:border-box=
;padding-right:35px;font-size:16px;margin-bottom:5px;color:rgb(49,53,59);fo=
nt-weight:bold;width:100%;white-space:nowrap;overflow:hidden;text-overflow:=
ellipsis">=E5=AD=99=E7=91=9E=E9=9C=9E</div>
                                        <div style=3D"font-size:0px;line-he=
ight:0">
                                        </div>
                                        <div style=3D"word-break:break-all"=
>
                                          =E9=82=AE=E7=AE=B1=EF=BC=9Arxsun@=
zd-tech.com.cn </div>
                                      </div>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </a> </div>
                          <div>
                            <p style=3D"border-top:1px solid rgb(229,229,22=
9);padding-top:8px;font-size:12px;color:rgb(182,184,187);line-height:1.833"=
>=E7=AD=BE=E5=90=8D=E7=94=B1
                              <a href=3D"https://mail.163.com/dashi/dlpro.h=
tml?from=3Dmail88" style=3D"color:rgb(106,168,246);text-decoration:none" ta=
rget=3D"_blank">=E7=BD=91=E6=98=93=E9=82=AE=E7=AE=B1=E5=A4=A7=E5=B8=88</a> =
=E5=AE=9A=E5=88=B6</p>
                          </div>
                        </div>
                      </div>
                      <div class=3D"gmail-m_2327925860975938968gmail-m_8207=
711357368344562gmail-m_1619914329257948851J-reply" style=3D"background-colo=
r:rgb(242,242,242);color:black;padding-top:6px;padding-bottom:6px;border-ra=
dius:3px;margin-top:45px;margin-bottom:20px">
                        <div style=3D"font-size:14px;line-height:1.5;word-b=
reak:break-all;margin-left:10px;margin-right:10px">On
                          <span class=3D"gmail-m_2327925860975938968gmail-m=
_8207711357368344562gmail-m_1619914329257948851mail-date">06/25/2019
                            23:25</span>, <a class=3D"gmail-m_2327925860975=
938968gmail-m_8207711357368344562gmail-m_1619914329257948851mail-to" style=
=3D"text-decoration:none;color:rgb(42,151,255)" href=3D"mailto:jandraara@gm=
ail.com" target=3D"_blank">Jandra
                            A</a> wrote: </div>
                      </div>
                      <blockquote id=3D"gmail-m_2327925860975938968gmail-m_=
8207711357368344562gmail-m_1619914329257948851ntes-iosmail-quote" style=3D"=
margin:0px">
                        <div dir=3D"ltr">Great, let&#39;s meet using my web=
ex=C2=A0<a href=3D"https://ibm.webex.com/meet/jandra.aranguren" target=3D"_=
blank">https://ibm.webex.com/meet/jandra.aranguren</a>=C2=A0I
                          will send you an invite as well.=C2=A0</div>
                        <br>
                        <div class=3D"gmail_quote">
                          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun
                            25, 2019 at 1:16 AM =E5=AD=99=E7=91=9E=E9=9C=9E=
 &lt;<a href=3D"mailto:rxsun@zd-tech.com.cn" target=3D"_blank">rxsun@zd-tec=
h.com.cn</a>&gt;
                            wrote:<br>
                          </div>
                          <blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
                            <div style=3D"line-height:1.7;color:rgb(0,0,0);=
font-size:14px;font-family:Arial">
                              <div>Hi,all,</div>
                              <div>I will be glad to meet at 7:00AM
                                Central time this Wednesday (June 26th).</d=
iv>
                              <div><br>
                              </div>
                              <div>Ruixia,Sun</div>
                              <br>
                              <br>
                              <br>
                              =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A&quot;Jan=
dra A&quot; &lt;<a href=3D"mailto:jandraara@gmail.com" target=3D"_blank">ja=
ndraara@gmail.com</a>&gt;<br>
                              =E5=8F=91=E9=80=81=E6=97=A5=E6=9C=9F=EF=BC=9A=
2019-06-25 00:51:39<br>
                              =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9Axiuzhi &l=
t;<a href=3D"mailto:1450335857@qq.com" target=3D"_blank">1450335857@qq.com<=
/a>&gt;<br>
                              =E6=8A=84=E9=80=81=E4=BA=BA=EF=BC=9ADerick &l=
t;<a href=3D"mailto:derick.montague@gmail.com" target=3D"_blank">derick.mon=
tague@gmail.com</a>&gt;,openbmc
                              &lt;<a href=3D"mailto:openbmc@lists.ozlabs.or=
g" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;,rxsun
                              &lt;<a href=3D"mailto:rxsun@zd-tech.com.cn" t=
arget=3D"_blank">rxsun@zd-tech.com.cn</a>&gt;<br>
                              =E4=B8=BB=E9=A2=98=EF=BC=9ARe: Re: Network Se=
ttings GUI<br>
                              <blockquote id=3D"gmail-m_2327925860975938968=
gmail-m_8207711357368344562gmail-m_1619914329257948851gmail-m_-823126862754=
0647716isReplyContent" style=3D"padding-left:1ex;margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204)">
                                <div dir=3D"ltr">Hi=C2=A0Xiuzhi and Ruixia,=
=C2=A0
                                  <div><br>
                                  </div>
                                  <div>It would be great to set some
                                    time to align on the requirements
                                    from design and how to work together
                                    so that your team can start on the
                                    so front-end development.=C2=A0=C2=A0<b=
r>
                                    <br>
                                    Like Derick said, we meet every
                                    other Wednesday at 10:00 Central
                                    time to discuss GUI issues, with the
                                    next one being next Wednesday (July
                                    3rd). Hopefully you can make that.=C2=
=A0</div>
                                  <div><br>
                                  </div>
                                  <div>If you cannot, I am happy to meet
                                    at 7:00 or 8:00 AM Central time this
                                    Wednesday (June 26th) or Friday
                                    (June 28th). Please let me know.=C2=A0<=
/div>
                                  <div><br>
                                  </div>
                                  <div>Regards,</div>
                                </div>
                                <br>
                                <div class=3D"gmail_quote">
                                  <div dir=3D"ltr" class=3D"gmail_attr">On
                                    Wed, Jun 19, 2019 at 8:30 PM xiuzhi
                                    &lt;<a href=3D"mailto:1450335857@qq.com=
" target=3D"_blank">1450335857@qq.com</a>&gt;
                                    wrote:<br>
                                  </div>
                                  <blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
                                    <div>Hi Derick,</div>
                                    <div>&gt;&gt; The IPV6 webui should
                                      support both IPV4 and IPV6 on a
                                      single interface at the same time
                                      and users can set IPV4 and IPV6 on
                                      the same network webpage from
                                      Lenovo test cases.</div>
                                    <div><br>
                                      &gt;Thank you!<br>
                                      <br>
                                      &gt;&gt;=C2=A0 Ruixia (her email: <a =
href=3D"mailto:rxsun@zd-tech.com.cn" target=3D"_blank">rxsun@zd-tech.com.cn=
</a>;),
                                      form my team can do=C2=A0 front-end=
=C2=A0 to
                                      implement your design .=C2=A0 It woul=
d
                                      be best if the IPV6 feature could
                                      be achieved in one to two months.<br>
                                      <br>
                                      &gt;It would be great if she were
                                      able to join our GUI Community<br>
                                      workgroup. It&#39;s every other
                                      Wednesday at 10:00 Central Time.
                                      We use<br>
                                      these to discuss all the GUI
                                      issues. Where are you located?<br>
                                      =C2=A0 I am in BeiJing=C2=A0 UTC+8. T=
he
                                      meeting time is=C2=A0=C2=A0Wednesday=
=C2=A0 23:00
                                      Beijing Time (Wednesday 10:00 am=C2=
=A0<span style=3D"font-family:Arial,Helvetica,sans-serif;font-size:17px">Ce=
ntral
                                        Daylight Time</span>),isn&#39;t it?=
</div>
                                    <div>&gt;GUI Community Workgroup
                                      Wiki:<br>
                                      <a href=3D"https://github.com/openbmc=
/openbmc/wiki/GUI-Design-work-group" target=3D"_blank">https://github.com/o=
penbmc/openbmc/wiki/GUI-Design-work-group</a><br>
                                    </div>
                                    <div><br>
                                    </div>
                                    <div>Best,</div>
                                    <div>Xiuzhi</div>
                                  </blockquote>
                                </div>
                              </blockquote>
                            </div>
                          </blockquote>
                        </div>
                      </blockquote>
                    </div>
                  </div>
                </blockquote>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--000000000000184fa5058dd222fb--

--000000000000184fa7058dd222fc
Content-Type: image/jpeg; name="1935163017.jpg"
Content-Disposition: inline; filename="1935163017.jpg"
Content-Transfer-Encoding: base64
Content-ID: <16bfc6d240bae9d23e51>
X-Attachment-Id: 16bfc6d240bae9d23e51

/9j/4AAQSkZJRgABAQAAAQABAAD/4QBoRXhpZgAASUkqAAgAAAADABIBAwABAAAAAQAAADEBAgAQ
AAAAMgAAAGmHBAABAAAAQgAAAAAAAABTaG90d2VsbCAwLjIyLjAAAgACoAkAAQAAAP0BAAADoAkA
AQAAAP0BAAAAAAAA/+EJ9Gh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJl
Z2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxu
czp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNC40LjAtRXhpdjIiPiA8cmRm
OlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1u
cyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczpleGlmPSJodHRwOi8vbnMu
YWRvYmUuY29tL2V4aWYvMS4wLyIgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZm
LzEuMC8iIGV4aWY6UGl4ZWxYRGltZW5zaW9uPSI1MDkiIGV4aWY6UGl4ZWxZRGltZW5zaW9uPSI1
MDkiIHRpZmY6SW1hZ2VXaWR0aD0iNTA5IiB0aWZmOkltYWdlSGVpZ2h0PSI1MDkiIHRpZmY6T3Jp
ZW50YXRpb249IjEiLz4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8P3hwYWNrZXQgZW5kPSJ3Ij8+/9sA
QwADAgIDAgIDAwMDBAMDBAUIBQUEBAUKBwcGCAwKDAwLCgsLDQ4SEA0OEQ4LCxAWEBETFBUVFQwP
FxgWFBgSFBUU/9sAQwEDBAQFBAUJBQUJFA0LDRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU
FBQUFBQUFBQUFBQUFBQUFBQUFBQU/8AAEQgB/QH9AwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAA
AAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQy
gZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVm
Z2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS
09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYH
CAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1Lw
FWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5
eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj
5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A+MyMZOCBu28npxnr+n1NdT4K/wBfD/19L/Sq
/j/WtN8QeKrq90my+wWkiqu08NKyr80jL0GSM8Yqx4K/18P/AF9L/SgD95R/F/nsKcv3h9aaP4v8
9hTl+8PrQBNZnbbZ9M14/wCIf2gZ9E+F2peJl0y3k1KPWrvRrKxeZlW4kiuJY15xnJSItxmvYLP/
AI9eu3rz6Vy1j4R8DaTrLatY6RoFjqryvcNewW0Mc7SNuDOXC7iTuYEk87jQB51pv7TsWq+OLLRr
fTIn07U76ztdL1Dzj/pKyWwuJdy4+R1V4yF53DeeNprUl/aOsdI1jWNP1TR72WSy1Ke2STThG6fZ
0MC+c+91Od1wg2qGJzwCOa7Wy8NeC9Mjgjs9N0O0iguBdRRwQwoscwTYJFAHyuF43DBxxnFOl8O+
DZ7m5uJdO0OWa5LNM7wQkyFihcsSvJYxxk567F9KAOHs/wBpvRpNXtNLvND1ezv7rUrrT4owsEmR
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
VQoUHGzCLlMbTtGQcCltvhj4ZsodQhg0tY4dQd3uohI5SUOrKyFScbMSP8mNo3sQASTQBxdp8eLm
PxNpujap4d+xPNefYLqeG5eaOOYy+UnlN5QEg3lN24oVD5AbBx67XK6Z8L/DWj3GmzWunFG04s1s
rXErojMWJcqzEM5Lt87At8x5rqqACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACiiigD+d+uq8Ff6+H/r6X+lcrXVeCv8AXw/9fS/0oA/eUfxf57CnL94fWmj+L/PYU5fvD60A
T2P/AB7j6mrFV7I4t89eTUnm4/gf8qAJKKi+0D+4/wD3zR9oH9x/++aAJaKi+0D+4/8A3zR9oH9x
/wDvmgCWiovtA/uP/wB80faB/cf/AL5oAloqL7QP7j/980faB/cf/vmgCWiovtA/uP8A980faB/c
f/vmgCWiovtA/uP/AN80faB/cf8A75oAloqL7QP7j/8AfNH2gf3H/wC+aAJaKi+0D+4//fNH2gf3
H/75oAloqL7QP7j/APfNH2gf3H/75oAloqL7QP7j/wDfNH2gf3H/AO+aAJaKi+0D+4//AHzR9oH9
x/8AvmgCWiovtA/uP/3zR9oH9x/++aAJaKi+0D+4/wD3zR9oH9x/++aAJaKi+0D+4/8A3zR9oH9x
/wDvmgCWiovtA/uP/wB80faB/cf/AL5oAloqL7QP7j/980faB/cf/vmgCWiovtA/uP8A980faB/c
f/vmgCWiovtA/uP/AN80faB/cf8A75oAloqL7QP7j/8AfNH2gf3H/wC+aAJaKi+0D+4//fNH2gf3
H/75oAloqL7QP7j/APfNH2gf3H/75oAloqL7QP7j/wDfNH2gf3H/AO+aAJaKi+0D+4//AHzR9oH9
x/8AvmgCWiovtA/uP/3zR9oH9x/++aAJaKi+0D+4/wD3zR9oH9x/++aAJaKi+0D+4/8A3zR9oH9x
/wDvmgCWiovtA/uP/wB80faB/cf/AL5oAloqL7QP7j/980faB/cf/vmgCWiovtA/uP8A980faB/c
f/vmgD+eSuq8Ff6+H/r6X+lcrXVeCv8AXw/9fS/0oA/eUfxf57CnL94fWmj+L/PYU5fvD60AT2P/
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
1EauGtrmwt9Sg220xkmhncxwFIwhZmdlICKC/wDs0QfG3wnN4gtNFN5eQ6hcmFUjuNKu4lR5S4iS
SR4gsbMY3AVypJHA5FcXon7Kvh3wxZafHo13Ppt5YW9lHDeQwRhjcW0jyJcSAKA7EOUbPBHHFdZo
Pwa0yx8aT+LdYki8QeIZYoYlvbqyjUwiIttMeAdp+c857DpzkA9EooooAKKKKACiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigD+d+uq8Ff6+H/AK+l/pXK11Xgr/Xw/wDX0v8ASgD95R/F/nsK
cv3h9aaP4v8APYU5fvD60ATWf/Hv+JpXtoi2TGM9elNtuLQnjIyeTgfnUm9gF4J7ZIxk49P89KFd
bMiUYy0kroRbaMNuC4PWpCgI9fWomnK7gMMw/h6HHY/0+tL5pDBcA9zjJ74o13YKKSslYlKAmgoC
CD09PSq8l9FDJDHLLHFJM5SJGIy7BSxUc8kAE8ehqcMd2MUFi7B6ZpDGD15+oFPooAbsHHPSkEYA
x+NPooAb5Yxj8Og6UBAB/kU6igAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo
oooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii
igD+d+uq8Ff6+H/r6X+lcrXVeCv9fD/19L/SgD95R/F/nsKcv3h9aaP4v89hTl+8PrQBPZf8e/4m
vm7Tf2cNX1fxot9r04stPt5tQuIZ7by5JlaTUnnj2MykxZjKZKY6V9IWX/Ht+J61hReILuSNXWG3
G7n/AFh9Pp7UAeHeNPhh8T/EmnoLy8h1s2F+629hcpA8NxEsUghuZVYbd5ZxuUDI2qy4PXqPGHgH
xxc+N4NT8P339m2z2lja3M1vOodVjNz5oUOrDrJH27V6S2tXb9be2POeZCf5ilOu3hIzBbHH/TQ/
4UAeFar4D+Lusajol492h1LS7HfbXMs0X2eG5bTmhc7MbjJ9oYkktjaenet/wdo/xbg8TeG5tW1K
4udGjkf+0o2NtE8gZ5DGVRWkBVQV3nzAxBXaoIOfVv7dvMY8m3/7+kf0oXXbxf8Aljbk98yHk+vS
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
--000000000000184fa7058dd222fc--
