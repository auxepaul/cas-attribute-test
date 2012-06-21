# cas-attribute-test
==================

Sample CAS project that demonstrates how to retrieve attributes per service from LDAP

## Changes to `deployerContextConfig.xml` 

### `UsernamePasswordCredentialsToPrincipalResolver` bean

```XML
<bean class="org.jasig.cas.authentication.principal.UsernamePasswordCredentialsToPrincipalResolver">
  <property name="attributeRepository" ref="attributeRepository"/>	
</bean>
```
### `attributeRepository` bean
```XML
<bean id="attributeRepository" class="org.jasig.services.persondir.support.ldap.LdapPersonAttributeDao">
  <property name="baseDN" value="ou=people,dc=uni,dc=edu"/>
  <property name="requireAllQueryAttributes" value="true"/>
  <property name="queryAttributeMapping">
  <map>
    <entry key="username" value="uid"/>
  </map>
  </property>
  <property name="contextSource" ref="contextSource"/>
  <property name="resultAttributeMapping">
  <map>
    <entry key="uid" value="uid" />
    <entry key="displayName" value="displayName" />
  </map>
  </property>
</bean>
```

### Example registered service managed by `serviceRegistryDao` bean
```XML
<bean class="org.jasig.cas.services.RegexRegisteredService">
  <property name="id" value="0" />
  <property name="name" value="HTTPS" />
  <property name="description" value="HTTPS services" />
  <property name="serviceId" value="^(https?)://.*" />
  <property name="evaluationOrder" value="1000" />
  <property name="allowedAttributes">
  <list>
    <value>uid</value>
    <value>displayName</value>
  </list>
  </property>    
</bean>
```