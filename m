Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2888DA3DE3C
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2025 16:22:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YzH6z43Q0z3cVR
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 02:22:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740064920;
	cv=none; b=deNjaW1ijYI2SraTChP9BXXe7X1UnNLiNciy/cd2fSF+6mj/0fIGA8UFJlbgdbADT0SLfDMMqIBuqhpxpo0vl7MBhKDgPnuP5GLDSeH8D2dx4IQikZgbvAMTljNnpesTYgzyXF6cAlurfm9x4J7HW1gYGlKpHdx+vT3vuro7O8eJxG8feFVWPA7Ky//rnfLfr1NPVySqLAb2smfkTl7JcYSrEF3TROZAW1Ha+pOM8AH+I/FSR5uAItjxA/3WrqWOSjshH5nW5s6lGQTvt2HSV1YpchKILaXKDQCxDwc+krVzd1B2GiY5BUYgHvDJ2BTgJpSxkt8JkXVeZhtecAh4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740064920; c=relaxed/relaxed;
	bh=7oqKsuEES0gwwz55ECcku1x5iFVulBGeIPuRhFOpRFs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PqCUVVlNmkNzrg4i8dZB7NxBXQFk9o6/Zd4QpbylvYpLu9VIB3WC3zn4/cLhp2iZOLMdbPm4nS0iWgNRvJIyESDEuypvtM8BgPVP0nK22H75x26gh8aFgA5/ec0rGvFzlrMZfCZeFUjQgmV8zUSgnZiv3ldKBW2ZLrncZbdG3rSh219YLDFr3FpMuXn8KHye9p+taK40cLWu/RzYg89q0elmmcNcsrFq0TFNgnbq8spuwmogxWDW2aUurIQm0fvNBAHDq3Yqzjy4HGZ8xZPup3tTso69tWMNoSJPQWMZudleinFq6iVzZnc4+dPE4d/3XP33SRy0+gkvzXo6p54wQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=klasgroup.com; dkim=pass (2048-bit key; secure) header.d=klasgroup.com header.i=@klasgroup.com header.a=rsa-sha256 header.s=default header.b=ewCWt/uU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=paul.gildea@klasgroup.com; receiver=lists.ozlabs.org) smtp.mailfrom=klasgroup.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=klasgroup.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=klasgroup.com header.i=@klasgroup.com header.a=rsa-sha256 header.s=default header.b=ewCWt/uU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=klasgroup.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=paul.gildea@klasgroup.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YzH6t2Csvz2yWK
	for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 02:21:56 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abb999658fbso139819466b.3
        for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2025 07:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=klasgroup.com; s=default; t=1740064908; x=1740669708; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7oqKsuEES0gwwz55ECcku1x5iFVulBGeIPuRhFOpRFs=;
        b=ewCWt/uUSW1Kj8JACDlF5c7WyzUuusEUcooYOwYPhse3AM3EN8ffywecWH8LCY+vRf
         1Swcpp4H1+rinLGj48G6s8omSQqA91XqYKsUk4rYiRE3jazoK9kj+yuWVLv4SkjbqCZ1
         8Gk/zbZA24usXpi3iE4HwoRMYJ9j7soTjZsUaYOCCJT2znMANoJpqdvvAeHkBl3TJ4F0
         DWoAlw5xnQu8frnbbb6vRMuIrGeoJI4dFtuNDq46jpPWIbKfHHjXfZcg1VjX3ok/4PlE
         iGdOKaCZUaAYlGNJznncfnhQ3T12wbPfiPfNMfaHYT5I132J8i5AuKcgYhURHItlCvvt
         zw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740064908; x=1740669708;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7oqKsuEES0gwwz55ECcku1x5iFVulBGeIPuRhFOpRFs=;
        b=mrux+NhVIg6J77q96xKVz6day51c0/JA9tya1RQ6A8HNtUZp+oFh8wcxUeu119sLDD
         rsohQJ1sOzMlX92gGywjbbmsE3i3XdsGPsGFs9sgXpn9mY4OAKGo9+FaNDlnvmRWgUBz
         dhTHqkrD72XlmQXxYaO5R29I44OZplmVBpJ74XgZ5oPlF31oF/NvmYroGKisX72zZ3AK
         odk9emvF9qlYtNPam1DyibbJmmwQfXWMOTcZoCZBAlX/Q/bCLLY5o6MPUTzmBPeNynd/
         LCeOSWGaJu0DQwfa9D5Y0Aubgat2ZvLD3G3noST6K4zo5DLeiwWb/5k01oztdXyATEmD
         8KjA==
X-Gm-Message-State: AOJu0YxuzgjRrudozVVwrb7mQsAEQSOwMNU3joyG1I1iF9WPp6F9HWHa
	+fU4FlO0ZBwVMkQ0um52++KBslE7buKkHrSplk180ZxjHoRnE4RvXJJdFYDX/rDHra93T2p/mk1
	OlxvxuFXIdymTfdht7wYmgWN2GecREujnLruWRQBvc4qDjrSq614juO9vUFVwPhdpyVbmr08nAp
	AvLhzvTjQD/ilDkF6guo4FXOJokHuqB/sS4Ft4
X-Gm-Gg: ASbGncu/IHsz3g+dyYz6h1R8KLFYCoPjtnRRqH8t4FTVVMEd56elbAEfBZQONQsj+0t
	dohDYrFgEWkApjJh943gzrAqBTJINWefTNxh9ORP+sUpRCO6HCMGAcpxSx3eJYv4VfL0S29uZZA
	==
X-Google-Smtp-Source: AGHT+IEYzb90d1+gyi3TscF0rsqX/vcVivxBEhb62AqEV5BhbSwfATzQoQNMIQd6Zh5SXvfl7B1uCBCNzfgsKT15Wf8=
X-Received: by 2002:a05:6402:2347:b0:5e0:8c55:50d with SMTP id
 4fb4d7f45d1cf-5e08c5514bbmr16494458a12.14.1740064908206; Thu, 20 Feb 2025
 07:21:48 -0800 (PST)
MIME-Version: 1.0
From: Paul Gildea <Paul.Gildea@klasgroup.com>
Date: Thu, 20 Feb 2025 15:21:32 +0000
X-Gm-Features: AWEUYZnESxR9KarBlu8mXPoiDavnxj5L0-LcAosCjPUQcn3UpQQK2XJGsy9XOaU
Message-ID: <CAAYvRVNHXpyuQ=tK5cqJtqQn5SqFvi=hp+qTvz0qPi-ZW=ymHQ@mail.gmail.com>
Subject: Adding FRU information to Redfish/bmcweb with Entity-Manager
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000bd7bab062e946e83"
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_IMAGE_ONLY_24,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

--000000000000bd7bab062e946e83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have FRU/EEPROM information, serial number etc, that I want to make
available in bmcweb/Redfish. I've written an Entity-Manager config that
exposes the information to D-BUS, this shows me the expected
path/information on D-BUS under Entity-Manager when queried. I can also see
the information in ObjectMapper.

Am I right in thinking that information should then be picked up in
chassis.hpp and be available for Redfish calls? I don't get anything back
when I make a Redfish call, nor do I see any reference to my newly added
sub component. Is there something missing in the process that I am doing?

Thanks,
Paul

--=20




This message is intended solely for the person or entity to which it is=20
addressed and may contain confidential and/or privileged material.=C2=A0=C2=
=A0If you=20
have received this message in error, please send it back to us, immediately=
=20
and permanently delete it,=C2=A0and do not use, copy or disclose the inform=
ation=20
contained in this message or in any attachment.



Klas LTD (Company Number=20
163303) trading as Klas, an Irish private company limited by shares, with=
=20
its registered office at One Kilmainham Square, Dublin 8, Ireland D08 ET1W.





Klas Telecom Inc., a Virginia Corporation with offices at 1101 30th=20
St. NW, Washington, DC 20007.




--000000000000bd7bab062e946e83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>I have FRU/EEPROM informa=
tion, serial number etc, that I want to make available in bmcweb/Redfish. I=
&#39;ve written an Entity-Manager config that exposes the information to D-=
BUS, this shows me the expected path/information on D-BUS under Entity-Mana=
ger when queried. I can also see the information=C2=A0in ObjectMapper.</div=
><div><br></div><div>Am I right in thinking that information should then be=
 picked up in chassis.hpp and be available for Redfish calls? I don&#39;t g=
et anything=C2=A0back when I make a Redfish call, nor do I see any referenc=
e to my newly added sub component. Is there something=C2=A0missing in the p=
rocess that I am doing?=C2=A0=C2=A0</div><div><br></div><div>Thanks,<br>Pau=
l</div></div>

<br>
<div style=3D"font-size:1.3em"><img src=3D"https://www.klasgroup.com/wp-con=
tent/uploads/2020/11/Klas-Logo-30px.png"></div><div style=3D"font-size:1.3e=
m"><br></div><div style=3D"font-family:Arial,Helvetica,sans-serif"><div sty=
le=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-size:1.3e=
m"><img></span><br><div style=3D"font-family:Arial,Helvetica,sans-serif"><d=
iv dir=3D"ltr" style=3D"color:rgb(34,34,34);background-color:rgb(255,255,25=
5)"><font size=3D"1">This message is intended solely for the person or enti=
ty to which it is addressed and may contain confidential and/or privileged =
material.=C2=A0=C2=A0If you have received this message in error, please sen=
d it back to us, immediately and permanently delete it,=C2=A0and do not use=
, copy or disclose the information contained in this message or in any atta=
chment.<br></font></div><div dir=3D"ltr" style=3D"color:rgb(34,34,34);backg=
round-color:rgb(255,255,255)"><div dir=3D"ltr"><font size=3D"1"><br></font>=
</div><div dir=3D"ltr"><font size=3D"1">Klas LTD (Company Number 163303) tr=
ading as Klas, an Irish private company limited by shares, with its registe=
red office at One Kilmainham Square, Dublin 8, Ireland D08 ET1W.<br></font>=
</div><div dir=3D"ltr"><font size=3D"1"><br></font></div><div dir=3D"ltr"><=
/div></div><span style=3D"color:rgb(80,0,80);background-color:rgb(255,255,2=
55)"><div dir=3D"ltr"><font size=3D"1">Klas Telecom Inc., a Virginia Corpor=
ation with offices at 1101 30th St. NW, Washington, DC 20007.</font></div><=
/span></div></div></div>
--000000000000bd7bab062e946e83--
